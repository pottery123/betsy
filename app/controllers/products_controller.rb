class ProductsController < ApplicationController
  def index
    # right now this generates a list of every product in the products table.
    @products = Product.order(id: :asc)
    render :index
  end 
      
  def show
    # this needs to be amended to hook into the session 
    @user = User.find(params[:id])
    redirect_to index
  end

  def new
<<<<<<< HEAD
    # user = curent user here.
=======
    @user = User.find(params[:id])
>>>>>>> 2da8e960313038c460c3632a189734ad84811431
    @product = Product.new
    render :create_product
  end

  def create 
    @product = Product.create(product_create_params[:product])
<<<<<<< HEAD
    redirect_to products_show_path(@current_user.id)
=======
    redirect_to products_show_path(@product.vendor_id)
>>>>>>> 2da8e960313038c460c3632a189734ad84811431
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end 

  def update
    @product = Product.find(params[:id])
    @product.update(product_update_params[:product])
    redirect_to products_show_path(@current_user.id)
  end

  def destroy
   killed_record = Product.destroy(params[:id])
   if params[:id] = true 
     redirect_to products_show_path(@current_user.id)
   end 
  end 

  private

  def product_create_params
    params.permit(product: [:item, :user_id]) 
  end
end
