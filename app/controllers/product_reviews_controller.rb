class ProductReviewsController < ApplicationController

  before_action :set_product_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_admin, only: [:edit, :update, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @product.product_reviews.create(product_review_params)

    redirect_to store_show_path(@product.id)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @product_review = @product.product_reviews.find(params[:id])

    @product_review.destroy
    redirect_to product_path(@product.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_review
      @product_review = ProductReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_review_params
      params.require(:product_review).permit(:author, :comment, :rating, :product_id)
    end
end
