Rails.application.routes.draw do
  match '/500', via: :all, to: 'errors#internal_server_error'
  match '/404', via: :all, to: 'errors#not_found'
  match "*path", via: :all, to: "errors#does_not_exist"

  get 'errors/not_found'
  get 'home', to: 'home#index'
  get 'dashboard', to: 'static_pages#dashboard'
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
  root "lists#index"
  resources :games do
    member do
      get 'invite', to: 'games#invite'
    end
  end
  resources :posts
  resources :products, only: [:index, :show]
  resources :lists do
    member do
      put :sort
    end
  end
  resources :tasks do
    member do
      put :sort
    end
  end
  resources :users, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
