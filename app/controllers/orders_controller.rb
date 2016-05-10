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

  def reduce_inventory(order)
    @items = OrderItem.find(order).quantity
    @product = Product.find(order).name
    @items.each do |item|
      quantity = item.quantity
      if @product.quantity < 0
        flash[:error] = "Sorry, this is out of stock!"
        redirect_to product_path(params[:product_id])
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