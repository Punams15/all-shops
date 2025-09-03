Rails.application.routes.draw do
  get "reviews/index"
  get "promotions/index"
  get "orders/index"
  get "orders/show"
  get "cart/index"
  get "sellers/index"
  get "sellers/show"
  get "products/index"
  get "products/show"
  get "subcategories/index"
  get "subcategories/show"
  get "categories/index"
  get "categories/show"
  get "home/index"
  # Root path (homepage)
  root "home#index"   #Products#index

  # Categories → Subcategories → Products
  resources :categories, only: [:index, :show] do
    resources :subcategories, only: [:index, :show] do
      resources :products, only: [:index]
    end
  end

  # Products and Sellers
  resources :products, only: [:index, :show]
  resources :sellers, only: [:index, :show]

  # Shopping cart & Orders
  resources :cart, only: [:index]          # just a placeholder for now
  resources :orders, only: [:index, :show]

  # Promotions & Reviews
  resources :promotions, only: [:index]
  resources :reviews, only: [:index]
end
