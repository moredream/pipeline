Pipeline::Application.routes.draw do

  %w[about privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end


  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :programs

  resources :users , only: [:index, :show]

  #resources :users
  resources :profiles
  resources :microposts ,  only: [:create, :destroy]

  get "welcome/index"

  root 'welcome#index'



end
