class ProductReview < ApplicationRecord
  belongs_to :product

  validates_presence_of :author, :comment, :rating
  validates_inclusion_of :rating, in: 1..10

end
