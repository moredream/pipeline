Pipeline::Application.routes.draw do

  %w[about privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end


  # devise_for :admin_users, ActiveAdmin::Devise.config

  # ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users , only: [:index, :show]
  resources :profiles


  concern :attachable do
     resources :photos
  end

  resources :articles, concerns: :attachable
  resources :programs, concerns: :attachable

  resources :microposts ,  only: [:create, :destroy]
  get 'tags/:tag', to: 'articles#index', as: :tag

  get "welcome/index"

  root 'welcome#index'



end
