class DitzyController < ApplicationController

  def index 
    @new_products = Product.last(3)
  end 

end
