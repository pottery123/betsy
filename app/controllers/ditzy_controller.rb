class DitzyController < ApplicationController

  def index 
    @products = Product.all
    @new_products = Product.last(3)
  end 

end
