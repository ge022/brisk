class ReviewsController < ApplicationController

  before_action :authenticate_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  # def index
  #   @reviews = Review.all
  # end

  # GET /reviews/1
  # GET /reviews/1.json
  # def show
  # end

  # GET /reviews/new
  # def new
  #   @review = Review.new
  # end

  # GET /reviews/1/edit
  # def edit
  # end

  # POST /reviews
  # POST /reviews.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to restaurant_path(@restaurant.id)
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  # def update
  #   respond_to do |format|
  #     if @review.update(review_params)
  #       format.html { redirect_to @review, notice: 'Review was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @review }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :review_text, :rating, :restaurant_id)
    end
end
