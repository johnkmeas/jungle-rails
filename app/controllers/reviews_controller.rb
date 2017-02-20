class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    #find the parent model which should be product
    @product = Product.find(params[:product_id])

    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id if current_user

    if @review.save!
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy

    redirect_to :back, :notice => "Your post has been deleted"
  end
  private

    def review_params
      params.require(:review).permit(:description, :rating, :id)
    end
end
