class CategoriesController < ApplicationController
  
  # we could use this to run a clickable list of categories that will enable folks to see what all the categories are.
  def index
  end

  def show_by_category
    @merchant = User.find(params[:id])
    @products = Product.where(user_id: @merchant.id)

    render :categories_products
  end

  def create
    @category = Category.new(category_create_params[:category])
    if @category.save
      redirect_to dashboard_path(current_user.id)
    else
      # this sucks - place holder for the moment
      render dashboard_path
    end
  end

  private
  def category_create_params
    params.permit(category: [:name])
  end
end