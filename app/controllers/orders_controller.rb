class OrdersController < ApplicationController
  # This should be the confirmation page for orders
  # after order is complete

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
    #   # order.status = "complete"
    #
    # call complete_order here
    # Send to the confirmation page aka orders#show
    check_inventory(@order)
    if @order.save
      reduce_inventory(@order)
      render :text => "yeah!"
    else
      render :new
    end
  end

  # def complete_order
  #   # locate the order
  #   @order = Order.find(session[:order_id])
  #   @order = Order.update
  #   render :show
  #
  #   # we need to add a status column to orders
  #
  #   # order.updated_at = Time.now
  #   # order.status = "complete"
  #
  #   # reduce_inventory(order)
  #   # if order.save
  #   #   redirect_to confirmation_page_path
  #   # else
  #   #   render :new
  #   # end
  # end

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




end
