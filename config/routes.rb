Rails.application.routes.draw do
  resources :api_tokens
  resources :locations
  match '/500', via: :all, to: 'errors#internal_server_error'
  match '/404', via: :all, to: 'errors#not_found'

  get 'errors/not_found'
  get 'home', to: 'home#index'
  get 'dashboard', to: 'static_pages#dashboard'
  get  'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get  'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'cookies', to: 'cookies#index'
  resources :sessions, only: %i[index show destroy]
  resource  :password, only: %i[edit update]
  namespace :identity do
    resource :email,              only: %i[edit update]
    resource :email_verification, only: %i[show create]
    resource :password_reset,     only: %i[new edit create update]
  end
  root 'lists#index'
  resources :addresses
  resources :games do
    member do
      get 'invite', to: 'games#invite'
    end
  end
  resources :posts
  resources :rooms do
    member do
      get :hovercard
    end
  end
  resources :movies do
    collection do
      post :search
    end
  end
  resources :products, only: %i[index show]
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
  resources :users, only: [:index] do
    collection do
      patch :bulk_update
    end
  end
  resources :notifications
  resources :interactions, only: %i[create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  match '*path', via: :all, to: 'errors#does_not_exist'
end
