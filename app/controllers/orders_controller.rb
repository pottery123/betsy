class OrdersController < ApplicationController
 
  def show 
    # array them because they are relations. Can't .each a relation object 
    @order_items = OrderItem.all.to_a
    @product = Product.all .to_a
    # @order_items = OrderItem.where(order: params[:user_id])
    # @product = Product.find(user_id: params[:user_id])

  end

  def new
    @order = Order.new
  end

  def create 
    @order = Order.new
    if @order.save
      # flash message?
      redirect_to orders_path
    else
      render :new
    end 
  end

  def edit
    @order_edit = OrderItem.find(id: params[:id])
  end 

  def update
    @order_update = OrderItem.find(id: params[:id]) 
    # logic to check inventory 
    # if quantity requested < quantity in stock, 
    # flash message "sorry we only have x of that item"
    @order.update(update_params[:orderitem])
    # message about quantity updated 
    redirect_to order_path
  end

  # def destroy
  #   Order.destroy(params[:id])
  #   if params[:id] = true
  #     # flash message
  #     redirect_to order_path
  #   end
  # end 
  private


  def update_params
    params.permit(orderitem: [:quantity])
  end
end
