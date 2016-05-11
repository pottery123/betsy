class OrdersController < ApplicationController

  def create
    # @order = Order.new(session[:order_id])
    # if @order.save
    #   # update the order with billing info
    #   # change from pending to completed
    # else
    #   render :new
    # end
  end

  def reduce_inventory
    #untested code, will test when order#create is complete 
    @items = OrderItem.where(session[:order_id])
    @products = Product.where(session[:order_id]))
    @items.each do |item|
      quantity = item.quantity
      if @product.quantity < 0
        flash[:error] = "Sorry, this is out of stock!"
        redirect_to checkout_path
      else
        @product.quantity -= quantity
      end
    end
  end

  def complete_order
    # locate the order and "complete it"
    @order_details = OrderItem.where(session[:order_id])
    clear_cart
    
    #this is the confirmation page 
    redirect_to :show 
  end

  def clear_cart 
    OrderItem.destroy(@order_details)
  end 
end  