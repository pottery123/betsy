class ReviewsController < ApplicationController
  def index
    @review = Review.where(product_id: params[:product_id])
  end

  def show
      @review = Sale.all.where(params[:product_id])

  end

  def new
      @review = Review.all.where(params[:product_id])
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
