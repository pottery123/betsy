Rails.application.routes.draw do
  # this creates an session order ID for guests 
  root 'sessions#create_order'

  # get '/cart' => 'order_item#index', :as => 'cart'
  # post '/cart' => 'order_item#index' 

  get '/users/:user_id/products' => 'products#show_by_merchant', as: "user_products"
  # get '/account' => 'users'

  get  '/categories/:category_id/products' => 'products#show_by_category', as: "category_products"

  resources :sessions, :only => [:new, :create, :destroy]
  delete '/logout' => 'sessions#destroy'

  resources :billings
  
  resources :users, :only => [:new, :create] do
    # resources :products (commented out to write what's needed by hand)
    resources :orders
  end

  resources :orders do 
    resources :users
  end

  resources :products do
    resources :reviews
    resources :orders
  end
  get 'dashboard/:id' => 'users#show_by_merchant', :as => 'dashboard'

  # resources :reviews do
  #   resources :users
  #   resources :products
  # end

end 
    