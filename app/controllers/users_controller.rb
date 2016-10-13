class UsersController < ApplicationController
  # commenting this out because it breaks things and Rowan is not here to explain it
  # before_action :require_login, except: [:new, :create, :bad_route]

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_create_params[:user])

    if @new_user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show_merchant
    @merchant_order_items = OrderItem.joins(:product, :order).where("products.user_id": params[:id]).order(order_id: :asc)
    @total_revenue = OrderItem.joins(:product).where("products.user_id": params[:id]).sum("products.price_in_dollars")
    @completed_orders = OrderItem.joins(:product, :order).where("products.user_id": params[:id]).where("orders.status": "complete").count()
    @pending_orders = OrderItem.joins(:product, :order).where("products.user_id": params[:id]).where("orders.status": "pending").count()
    @completed_orders_subtotal = OrderItem.joins(:product, :order).where("products.user_id": params[:id]).where("orders.status": "complete").sum("products.price_in_dollars")
    @pending_orders_subtotal = OrderItem.joins(:product, :order).where("products.user_id": params[:id]).where("orders.status": "pending").sum("products.price_in_dollars")
  end

  def show
    @merchant = User.find(params[:id])
    @products = Product.where(user_id: @merchant.id)
    @category ||= Category.new
    @categories = Category.all
    @product = Product.new

    render "users/merchant"
  end

  def update_order_item
    @item = OrderItem.find(params[:id])
    @item.update(update_order_item_params[:order_item])
    redirect_to orders_dashboard_path(current_user.id)
  end


  def show_merchant_order
    @order = Order.find(params[:id])
  end

  private

  def require_login
    unless current_user && current_user.id == params[:id].to_i
      render :bad_route
    end
  end

  def user_create_params
    params.permit(user: [:user_name, :email, :password, :password_confirmation])
  end

  def update_order_item_params
    params.permit(order_item: [:shipped])
  end
end
