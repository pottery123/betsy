class ProductsController < ApplicationController
  def index

    # right now this generates a list of every product in the products table.
    @products = Product.order(id: :asc)
    render :index
  end 
      
  def show
    # this needs to be amended to hook into the session 
    # controller action: if @user_id (show "list" view for user)/if category (show "list" view by category)
    @user = User.find(params[:id])
    redirect_to index
  end

  def new
    @user = User.find(params[:id])
    @product = Product.new
    render :create_product
  end

  def create 
    @product = Product.create(product_create_params[:product])
    redirect_to products_show_path(@product.vendor_id)
  end

  def edit
  end 

  def update
  end

  def delete
  end 
end
