class OrdersController < ApplicationController
  # This should be the confirmation page for orders
 def show
   @order = Order.find(session[:order_id])
 end

 def new
   @order = Order.new
 end

 def complete_purchase
    locate the order 
    order = Order.find(session[:order_id])
    # possible code to complete the order, needs testing:

    # order.completed_time = Time.now
    # order.completion_status = "complete"
    # reduce_inventory(order)
    # if order.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

 def reduce_inventory(order)
    @items = order.order_items
    @items.each do |item|
      product = item.product
      quantity = item.quantity
      if product.stock < 0
        flash[:error] = "Sorry, this is out of stock!"
        redirect_to product_path(params[:product_id])
      else
        product.stock = product.stock - quantity
      end
    end
  end

 def find_order
    @order = Order.find(session[:order_id])
 end

  def create
    @order = Order.new(order_params[session[:order_id])
    if @order.save
      redirect_to products_path
    else
      render :new
    end
  end
end  