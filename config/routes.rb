Rails.application.routes.draw do

  # Creates an empty cart and an order id for guests from session id
  root 'sessions#create_order'

  get '/complete' => 'orders#show', as: 'complete_order'
  get '/checkout' => 'orders#new', as: 'checkout'

  post '/checkout' => 'orders#create'

  post '/cart/shipping' => 'order_item#shipping'

  get '/cart' => 'order_item#index', as: 'cart'
  post '/cart' => 'order_item#create'
  delete '/cart' => 'order_item#destroy'
  patch '/cart/:id' => 'order_item#update', as: 'update_cart'
  get 'dashboard/:id' => 'users#show', :as => 'dashboard'
  get 'dashboard/orders/:id' => 'users#show_merchant', :as => 'orders_dashboard'
  get 'dashboard/order_item/:id' => 'order_item#show', :as => 'order_item'
  patch 'dashboard/order_item/:id' => 'users#update_order_item'
  get 'dashboard/order/:id' => 'users#show_merchant_order', :as => 'merchant_order'
  get 'store/:id' => 'products#show_merchant_store', :as => 'merchant_store'

  get  '/categories/:category_id/products' => 'products#show_by_category', as: "category_products"
  delete '/logout' => 'sessions#destroy'

  resources :sessions, :only => [:new, :create, :destroy]

  resources :users, :only => [:new, :create] do

  end

  resources :products do
    resources :reviews, :only => [:new, :create]
  end

  resources :categories, :only => [:new, :create]

end
