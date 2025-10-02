Rails.application.routes.draw do
  root "home#index"

  # User authentication
  get  "/signup", to: "users#new", as: :signup
  post "/signup", to: "users#create"
  get    "/login",  to: "sessions#new", as: :login
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
  resources :users, only: [:show, :edit, :update, :destroy]

  # Categories / Subcategories
  resources :categories do
    resources :subcategories
  end

  # Shops with full nested product CRUD
  resources :shops do
    resources :products # all actions
  end

  # Top-level products (read-only)
  resources :products, only: [:index, :show]

  # Orders
  resources :orders

  # Promotions, Reviews
  resources :promotions
  resources :reviews

  # Cart
  resource :cart, only: [:show]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end

