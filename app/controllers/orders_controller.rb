class OrdersController < ApplicationController
  # This should be the confirmation page for orders
  # after order is complete
  def show
    @order = Order.find(session[:order_id])
  end

  def new
    # this is where I think billing should be rolled into orders
    # the page right after the cart
    @order = Order.new
  end

  def create

    @order = Order.new(order_params[session[:order_id]])
    @order = Order.update(status:"pending")
    if @order.save
      # call complete_order here
      # Send to the confirmation page aka orders#show
    else
      render :new
    end
  end

  def complete_order
    # locate the order
    order = Order.find(session[:order_id])
    render :show

    # we need to add a status column to orders

    # order.updated_at = Time.now
    # order.status = "complete"

    # reduce_inventory(order)
    # if order.save
    #   redirect_to confirmation_page_path
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
end
