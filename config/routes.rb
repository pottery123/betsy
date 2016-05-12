Rails.application.routes.draw do

  # Creates an empty cart and an order id for guests from session id
  root 'sessions#create_order'
  get '/complete' => 'orders#show', as: 'complete_order'
  get '/checkout' => 'orders#new', as: 'checkout'
  
  # THERE IS A DUPLICATE ROUTE HERE AND I DON'T KNOW WHICH ONE CHECKOUT NEEDS!
  post '/checkout' => 'orders#create'
  post '/checkout' => 'orders#complete_order'

  get '/cart' => 'order_item#index', as: 'cart'
  post '/cart' => 'order_item#create'
  delete '/cart' => 'order_item#destroy'
  patch '/cart/:id' => 'order_item#update', as: 'update_cart'
  get 'dashboard/:id' => 'users#show', :as => 'dashboard'
  # get 'dashboard/:id' => 'users#show_by_merchant', :as => 'dashboard'
  # get '/users/:user_id/products' => 'products#show_by_merchant', as: "user_products"
  # get '/account' => 'users'
  get  '/categories/:category_id/products' => 'products#show_by_category', as: "category_products"
  delete '/logout' => 'sessions#destroy'
  # get 'dashboard/:id' => 'users#show_by_merchant', :as => 'dashboard'

  resources :sessions, :only => [:new, :create, :destroy]

  # resources :billings

  resources :users, :only => [:new, :create] do
    # resources :products (commented out to write what's needed by hand)
    # resources :orders 
  end

  resources :products do
    resources :reviews, :only => [:new, :create]
    # resources :orders
  end

  resources :categories, :only => [:new, :create]

  resources :orders do
    # resources :users
  end

  # resources :reviews do
  #   resources :users
  #   resources :products
  # end

end
