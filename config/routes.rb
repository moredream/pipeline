Pipeline::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  %w[about intro privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",registrations: "registrations"}

  resources :users , only: [:index, :show, :edit,:update]

  resources :labs, :papers
  resources :gurus, only: [:new, :create,  :edit, :update, :destroy]

  concern :photoable do
    resources :photos, only: [:index, :new, :create, :show, :destroy]
  end

  concern :commentable do
    resources :comments, only: [:index, :new, :create, :show, :destroy]
  end

  # resources :articles, concerns: :sociable
  resources :programs, concerns: [:photoable, :commentable]
  resources :papers , concerns: :commentable

  resources :articles do
    concerns :commentable
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
    collection { get :search, to: 'articles#search' }
  end

  resources :events do
    concerns :commentable
    member do
      put "like", to: "events#upvote"
      put "dislike", to: "events#downvote"
    end
    collection { get :search, to: 'events#search' }
  end

  resources :categories, only: [:index]

  get 'trends/:group', to: 'articles#index', as: :group

  get "welcome/index"

  root 'welcome#index'



end
