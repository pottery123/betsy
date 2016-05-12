class ProductsController < ApplicationController
  def index
    @new_products = Product.where(visible: true).last(3)
    @products = Product.where(visible: true).order(id: :asc)
    @categories = Category.all
    render :index
  end

  def show
    # controller action: if @user_id (show "list" view for user)/if category (show "list" view by category)
    @product = Product.where(visible: true).find(params[:id])
    @reviews = Review.where(product_id: @product.id)
    @merchant =  User.joins(:products).where("products.id": params[:id])
    render :product_details
  end

  def show_by_merchant
    @merchant = User.find(params[:user_id])
    @products = Product.where(visible: true).where(user_id: @merchant.id)

    render :users_products
  end

  def show_by_category
    @category = Category.find(params[:category_id])
    @products = Category.find(params[:category_id]).products.where(visible: true)
    render :categories_products
  end

  def new
    # user = curent user here.
    @user = User.find(params[:id])
    @product = Product.new
    render :create_product
  end

  def create
    @product = Product.create(product_create_params[:product])
    redirect_to dashboard_path(current_user.id)
  end

  def edit
    @product = Product.find(params[:product_id])
    # @categories = Product.find(params[:product_id]).categories
    @categories = Category.all
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_update_params[:product])
    redirect_to dashboard_path(current_user.id)
  end

  def destroy
   killed_record = Product.destroy(params[:id])
   if params[:id] = true
     redirect_to products_show_path(@current_user.id)
   end
  end 

  def show_merchant_store
    @merchant = User.find(params[:id])
    @merchant_products = Product.where(user_id: @merchant.id)
  end

  private
  def product_create_params
    params.permit(product: [:name, :user_id, :price_in_dollars, :visible, :quantity, :description, :image_url, :category_ids => []])
  end

  def product_update_params
    params.permit(product: [:name, :user_id, :price_in_dollars, :visible, :quantity, :description, :image_url, :category_ids => []])
  end
end
