class Restaurant < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates_presence_of :name, :location, :cuisine, :tags, :image
  validates :low_price_range, :high_price_range, numericality: {greater_than: 0}

  paginates_per 10

  after_save do |restaurant|
    User.where(newsletter: true).each do |user|
      UserMailer.restaurant_email(user, restaurant).deliver_now
    end
  end

end
