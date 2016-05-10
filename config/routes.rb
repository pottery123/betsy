Rails.application.routes.draw do

  # Creates an empty cart and an order id for guests from session id
    root 'sessions#create_order'

  resources :products do
    resources :reviews
  end

 get '/checkout' => 'orders#new', as: 'checkout'

  get '/cart' => 'order_item#index', as: 'cart'
  post '/cart' => 'order_item#create'
  delete '/cart' => 'order_item#destroy'
  patch '/cart/:id' => 'order_item#update', as: 'update_cart'

 #get 'dashboard/:id' => 'users#show', :as => 'dashboard'

  get '/users/:user_id/products' => 'products#show_by_merchant', as: "user_products"
  # get '/account' => 'users'

  get  '/categories/:category_id/products' => 'products#show_by_category', as: "category_products"


  resources :sessions, :only => [:new, :create, :destroy]
  delete '/logout' => 'sessions#destroy'

  #resources :billings

  resources :users, :only => [:new, :create] do
    # resources :products (commented out to write what's needed by hand)
    resources :orders
  end

  resources :products do
    resources :reviews
    resources :orders
  end

  resources :categories, :only => [:new, :create]

  resources :orders do
    resources :users
  end


  get 'dashboard/:id' => 'users#show_by_merchant', :as => 'dashboard'

  resources :products do
    resources :reviews
    resources :orders
  end


  # resources :reviews do
  #   resources :users
  #   resources :products
  # end

end
