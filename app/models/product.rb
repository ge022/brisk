class Product < ApplicationRecord

  has_many :product_reviews, dependent: :destroy

  validates_presence_of :name, :description,
                        :image_thumbnail, :image_full,
                        message: 'is required.'
  validates_numericality_of :quantity_on_hand, :selling_price,
                            :cost_of_product, :shipping_weight,
                            message: 'is required to be a number.'
  paginates_per 10
end
