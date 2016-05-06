class SessionsController < ApplicationController
  def new
  end

  # login for registered users 
  def create
    user = User.log_in(params[:session_data][:email], params[:session_data][:password])
    if user
      @products = Product.order(id: :asc)
      session[:user_id] = user.id
      redirect_to products_path
    else
      @products = Product.order(id: :asc)
      redirect_to products_path
    end
  end

  #login for guest users 
  def create_order
    @order = Order.create
    @products = Product.order(id: :asc)
    # this is the cart 
    session[:order_id] = @order.id
    redirect_to products_path
  end 

  def destroy
    session.delete :user_id
    @products = Product.order(id: :asc)
    redirect_to products_path
  end

end
