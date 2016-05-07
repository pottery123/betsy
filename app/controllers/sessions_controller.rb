class SessionsController < ApplicationController

  # login for registered users 
  def create
    current_user = User.log_in(params[:session_data][:email], params[:session_data][:password])
    if current_user
      session[:user_id] = current_user.id
      redirect_to products_path
    else
      redirect_to products_path
    end
  end

  #login for guest users 
  def create_order
    # brand new cart object
    @order = Order.create
    # this is the cart object
    current_user, session[:order_id] = @order.id
    redirect_to products_path
  end 

  def destroy
    session.delete(:user_id)
    redirect_to products_path
  end

end
