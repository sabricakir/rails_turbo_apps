Rails.application.routes.draw do
  resources :tasks
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
