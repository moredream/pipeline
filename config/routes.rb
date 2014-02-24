Pipeline::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  %w[about intro privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end


  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",registrations: "registrations"}

  resources :users , only: [:index, :show, :edit,:update]


  resources :labs
  resources :gurus

  concern :sociable do
    resources :photos
    resources :comments
  end

  # resources :articles, concerns: :sociable
  resources :programs, concerns: :sociable

  resources :articles do
    concerns :sociable
    collection { get :search, to: 'articles#search' }
  end
  resources :categories, only: [:index]

  get 'trends/:tag', to: 'articles#index', as: :tag

  get "welcome/index"

  root 'welcome#index'



end
