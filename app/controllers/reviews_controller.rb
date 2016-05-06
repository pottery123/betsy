class ReviewsController < ApplicationController

    def show # show one all display a view that has already been created
        @review = Review.all.where(params[:product_id])
        render :new
    end


    def create
        @reviewparams = review_params
        @review = Review.new(review_params)
        if@review.save

        # this should reload the detail view for the product, but to do that Rowan needs to write
        # a show_product_details method in the controller.
        redirect_to "/"

        end
    end
    
    def index
      @review = Review.where(product_id: params[:product_id])
    end


    def edit
      @review = Reviews.find(params[:id])

      render :new

    end


  private

    def review_params
      params.require(:review).permit(:review_text, :rating, :product_id)
    end
end
