class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.all
    # begin
    #   @review = Review.find params[:id]
    # rescue ActiveRecord::RecordNotFound
    #   @review = nil
    # end
    @user = User.all
    # begin
  end

end
