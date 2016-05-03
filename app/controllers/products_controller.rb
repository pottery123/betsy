class ProductsController < ApplicationController
  def index
    @products = Product.order(id: :asc)
    render :index
  end 
      
  def show 
  end

  def new
  end

  def create 
  end

  def edit
  end 

  def update
  end

  def delete
  end 
end
