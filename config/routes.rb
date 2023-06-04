Rails.application.routes.draw do
  resources :games do
    member do
      get 'invite', to: 'games#invite'
    end
  end
  resources :posts
  root 'games#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
