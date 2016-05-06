class ReviewsController < ApplicationController
  #might only need index show delete
  def index #show all
    #@review = Review.where(product_id: params[:product_id]).first
<<<<<<< 261b8b35f6a09dec189f0b3994520130baec0634

  end

  def show # show one all display a view that has already been created
      @review = Review.all.where(params[:product_id])
      render :new
  end

  def new
      @review = Review.new
      @product = Product.find(params[:product_id])
      render :new
  end

  def create
      @reviewparams = review_params
      @review = Review.new(review_params)
      if  @review.save

      # this should reload the detail view for the product, but to do that Rowan needs to write
      # a show_product_details method in the controller.
      redirect_to "/"

      end

  def index
    @review = Review.where(product_id: params[:product_id])
  end
=======
>>>>>>> finished reviews for guest users

  end

  def show # show one all display a view that has already been created
      @review = Review.all.where(params[:product_id])
      render :new
  end

  def new
      @review = Review.all.where(params[:product_id])
      @review = Review.new
      @review.product_id = 1
      @product = Product.new
      @product.id = 1
      render :new
  end

  def create
<<<<<<< 261b8b35f6a09dec189f0b3994520130baec0634


=======
      @reviewparams = review_params
      @review = Review.new(review_params)
      if  @review.save
      redirect_to "/"
      end
>>>>>>> finished reviews for guest users

  end



  def edit

<<<<<<< 261b8b35f6a09dec189f0b3994520130baec0634

    @review = Reviews.find(params[:id])

    render :new
=======
    @review = Reviews.find(params[:id])

    render :new

>>>>>>> finished reviews for guest users
  end

  def update
  end

  def delete
  end
end


private

  def review_params
    params.require(:review).permit(:review_text, :rating, :product_id)
  end
