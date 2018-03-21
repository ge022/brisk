class Review < ApplicationRecord
  belongs_to :restaurant

  validates_inclusion_of :rating, in: 1..5

end
