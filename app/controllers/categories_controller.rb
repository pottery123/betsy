class CategoriesController < ApplicationController
  
  # we could use this to run a clickable list of categories that will enable folks to see what all the categories are.
  def index
  end

  def show_by_category
    @merchant = User.find(params[:id])
    @products = Product.where(user_id: @merchant.id)

    render :categories_products
  end


end
