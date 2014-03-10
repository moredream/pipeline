Pipeline::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  %w[about intro privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",registrations: "registrations"}

  resources :users , only: [:index, :show, :edit,:update]


  resources :labs, :papers
  resources :gurus

  concern :sociable do
    resources :photos, only: [:index, :new, :create, :show, :destroy]
    resources :comments, only: [:index, :new, :create, :show, :destroy]
  end

  # resources :articles, concerns: :sociable
  resources :programs, concerns: :sociable

  resources :articles do
    concerns :sociable
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
    collection { get :search, to: 'articles#search' }
  end
  resources :categories, only: [:index]

  get 'trends/:tag', to: 'articles#index', as: :tag

  get "welcome/index"

  root 'welcome#index'



end
