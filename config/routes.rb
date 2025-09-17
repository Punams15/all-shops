Rails.application.routes.draw do
  # Root path
  root "home#index"

  # Categories and nested Subcategories
  resources :categories do
    resources :subcategories
  end

  # Products, Sellers, Orders, Promotions, Reviews
  resources :products
  resources :sellers
  resources :orders
  resources :promotions
  resources :reviews

  # Singleton Cart
 resource :cart, only: [:show]

  # Optional health check route
  get "up" => "rails/health#show", as: :rails_health_check
end


