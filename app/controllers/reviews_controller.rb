class ReviewsController < ApplicationController

  def create
    #find the parent model which should be product
    @product = Product.find(params[:product_id])
    puts "from reviews controller #{@product}"
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id if current_user

    if @review.save!
      redirect_to "/products/#{params[:id]}"
    else
      redirect_to :back
    end
  end

  private

    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
