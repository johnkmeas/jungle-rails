class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    begin
      @product_review = Review.find params[:id]
    rescue ActiveRecord::RecordNotFound
      @product_review = nil
    end
    @user = User.all
  end

end
