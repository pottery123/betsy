class OrdersController < ApplicationController
  # confirmation page 
  def show 
    @order = Order.find(session[:order_id])
    @order_items = OrderItem.where(order_id: session[:order_id]).order("created_at asc")
    
    render :show
  end 

  def create
    @order = Order.find(session[:order_id])
    @order.status = "complete"
    @order.name_on_cc = params[:orders][:name_on_cc]
    @order.address = params[:orders][:address]
    @order.security_on_cc = params[:orders][:security_on_cc]
    @order.expiration_on_cc = params[:orders][:expiration_on_cc]
    @order.email = params[:orders][:email]
    @order.zip = params[:orders][:zip]
    @order.updated_at = Time.now

    # Send to the confirmation page aka orders#show
    check_inventory(@order)
    if @order.save
      reduce_inventory(@order)
      redirect_to complete_order_path
    else
      render :new
    end
  end

  def check_inventory(order)
    order.order_items.each do |item|
      if item.product.quantity < 0
        flash[:error] = "Sorry, this is out of stock!"
        redirect_to product_path(params[:product_id])
      end
    end
  end

  def reduce_inventory(order)
    order.order_items.each do |item|
      item.product.quantity -= item.quantity
      item.product.save
    end
  end

  # def complete_order
  #   # locate the order and "complete it"
  #   @order_details = OrderItem.where(session[:order_id])
  #   clear_cart

  #   #this is the confirmation page
  #   redirect_to :show
  # end

  # def clear_cart
  #   OrderItem.destroy(@order_details)
  # end
end

