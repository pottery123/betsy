class OrderItemController < ApplicationController

  def index
    # this is the cart! 
    @order = Order.find(session[:order_id])
  end



end
