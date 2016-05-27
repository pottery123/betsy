class OrdersController < ApplicationController
  # confirmation page
  def show
    @order = Order.find(session[:order_id])
    @order_items = OrderItem.where(order_id: session[:order_id]).order("created_at asc")
    render :show
  end

  def create
    @order = Order.find(session[:order_id])
    @order.expiration_on_cc = "#{params[:orders][:month]}-#{params[:orders][:year]}"
    # @order.expiration_on_cc = params[:orders][:month]

    @order.status = "not_placed" # Order is pending until they select shipping
    @order.name_on_cc = params[:orders][:name_on_cc]
    @order.address = params[:orders][:address]
    @order.country = params[:orders][:country]
    @order.state = params[:orders][:state]
    @order.city = params[:orders][:city]
    @order.security_on_cc = params[:orders][:security_on_cc]
    # @order.expiration_on_cc = Date.strptime(params[:orders][:expiration_on_cc], '%m-%y')
    @order.email = params[:orders][:email]
    @order.zip = params[:orders][:zip]
    @order.updated_at = Time.now

    # Send to the confirmation page aka orders#show
    check_inventory(@order)

    if @order.save
      # get quotes
      address = { country: @order.country, state:  @order.state, city:  @order.city, zip:  @order.zip }
      num_items = @order.order_items.count
      @shipping_response = ShipItWrapper.get_quotes(address, num_items)
      @rates =  JSON.parse(@shipping_response.body)
      @status = @shipping_response.code
      @order.update(rates: @rates)
      render :new
    else
      render :new
    end
  end

  def place_order #after they select shipping
    @order = Order.find(session[:order_id])
    @order.update(status: "pending")
    @order.update(shipping_selection: params["order"]["shipping_selection"])
    reduce_inventory(@order)
    redirect_to complete_order_path
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
