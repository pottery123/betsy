class SessionsController < ApplicationController

  # login for registered users 
  def create
    user = User.log_in(params[:session_data][:email], params[:session_data][:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  #login for guest users 
  def create_order
    # brand new cart 
    @order = Order.create
    # this is the cart 
    session[:order_id] = @order.id
    redirect_to products_path
  end 

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
