class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # @user_id = @product.reviews.find_by(id: params[:id]).user_id
    # @user_name = User.find_by(id: @user_id).name
    # byebug
    # @review = Review.new
    # @review = Review.all
    # begin
    #   @review = Review.find params[:id]
    # rescue ActiveRecord::RecordNotFound
    #   @review = nil
    # end

    # @review = Review.all
    # begin
  end

end
