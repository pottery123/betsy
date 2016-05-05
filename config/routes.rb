Rails.application.routes.draw do


 root 'ditzy#index'

 # get '/users/:user_id/products' => 'users#show_by_merchant', as: user_products
  # get '/account' => 'users'

  resources :sessions, :only => [:new, :create, :destroy]
  delete '/logout' => 'sessions#destroy'

  resources :users, :only => [:new, :create] do
    resources :products
    resources :orders
  end


  resources :orders do 
    resources :orderitems
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
