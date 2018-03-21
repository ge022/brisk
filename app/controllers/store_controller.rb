class StoreController < ApplicationController

  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def store_params
    params.require(:store).permit(:id)
  end

end