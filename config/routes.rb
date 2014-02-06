Pipeline::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  %w[about privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end


  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users , only: [:index, :show, :edit,:update]
  #resources :profiles , only: [:show, :edit,:update]
  resources :labs
  resources :gurus

  concern :sociable do
    resources :photos
    resources :comments
  end

  resources :articles, concerns: :sociable
  resources :programs, concerns: :sociable

  get 'tags/:tag', to: 'articles#index', as: :tag

  get "welcome/index"

  root 'welcome#index'



end
