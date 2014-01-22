Pipeline::Application.routes.draw do

  get "comments/index"
  get "comments/new"
  %w[about privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end


  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations:"registrations" }

  resources :users , only: [:index, :show]
  resources :profiles
  resources :gurus


  concern :attachable do
     resources :photos
  end

  concern :commentable do
     resources :comments
  end

  resources :articles, concerns: [:attachable , :commentable]
  resources :programs, concerns: [:attachable , :commentable]

  get 'tags/:tag', to: 'articles#index', as: :tag

  get "welcome/index"

  root 'welcome#index'



end
