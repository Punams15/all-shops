Rails.application.routes.draw do
  # Root path
  root "home#index"

  # Users (for signup/login/admin management)
  resources :users
  get "signup", to: "users#new", as: :signup
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  # Categories and nested Subcategories
  resources :categories do
    resources :subcategories
  end

  # Shops and Products
  resources :shops do
    resources :products
  end

  # Orders, Promotions, Reviews
  resources :orders
  resources :promotions
  resources :reviews

  # Singleton Cart
  resource :cart, only: [:show]

  # Optional health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
