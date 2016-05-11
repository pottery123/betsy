class CategoriesController < ApplicationController
  
  # we could use this to run a clickable list of categories that will enable folks to see what all the categories are.
  def index
  end

  def show_by_category
    @merchant = User.find(params[:id])
    @products = Product.where(user_id: @merchant.id)

    render :categories_products
  end
  #   if merchant && merchant.authenticate(params[:password])
  #       merchant_session[:merchant_id] = merchant.id
  #       redirect_to root_url, :notice => "Merchanthas been logged in"
  #   else
  #       flash.now[:error] = "Invalid username or password."
  #       @title  = "Merchant Signin"
  #       render "new"
  #   end
  def new
    @category = Category.new
  end

  def create
    # if category_create_params[:category][:name] == ""
    #   flash.now[:error] = "Please Enter a Catagory Name"
    #   raise
    # end
    @category = Category.new(category_create_params[:category])
    if @category.save
      redirect_to dashboard_path(current_user.id)
    else
      # this sucks - place holder for the moment
      render :bad_route

      # redirect_to dashboard_path(current_user.id) 
    end
  end

  private
  def category_create_params
    #     if category_create_params[:category][:name] == ""
    #   flash.now[:error] = "Please Enter a Catagory Name"
    #   raise
    # end
    params.permit(category: [:name])
  end
end

