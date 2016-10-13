require 'betsy_shipping'

class OrderItemController < ApplicationController

  # route for /cart
  def index
    @order = Order.find(session[:order_id])
    @order_items = OrderItem.where(order_id: session[:order_id]).order("created_at asc")
  end

  def shipping
    @order = Order.find(session[:order_id])
    @order_items = OrderItem.where(order_id: session[:order_id])
    # if response.code == 204
    #   flash[:yay] = "Favorite Deleted #{response.code}"
    # else
    #   flash[:nope] = "Something Went Wrong #{response.code}"
    # end

    if !params[:zipcode].match(/^\d{5}(-\d{4})?$/) && params[:zipcode]
      flash[:nope] = "This needs to be a valid zipcode, ex: 98103"
    end
    if params[:zipcode]
      if response.code == "200"
        quantity = @order_items.inject(0) { |sum, n| sum + n[:quantity]}
        @quotes = BetsyShippingWrapper.get_quotes(params[:zipcode], quantity, @order.id)
        if @quotes.code == 200 || @quotes.code == "200"
          render :index
        else
          flash[:nope] = "Something Went Wrong in #{@quotes.code}"
          render :index
        end
      else
        flash[:nope] = "Something Went Wrong #{response.code}"
      end
    end
    # render :index
  end

  def total
    @order = Order.find(session[:order_id])
    @order_items = OrderItem.where(order_id: session[:order_id])
    if params[:service_name]
      @shipping = params[:service_name].to_i
    end
    render :index
  end

  def create
    # quantity 1 is default, params[:format] is where the product id comes from
    @order_item = OrderItem.new(order_id: session[:order_id], quantity: 1, product_id: params[:format])
    if @order_item.save
      redirect_to cart_path
    else
      redirect_to products_path
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(quantity: params[:order_item][:quantity])
    redirect_to cart_path
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path
  end

  def show
    @order_item = OrderItem.find(params[:id])
    @order_product = Product.find(@order_item.product_id)
  end
end
