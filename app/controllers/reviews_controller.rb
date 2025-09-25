class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review.product, notice: "Review added!"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :product_id, :user_id)
  end
end
