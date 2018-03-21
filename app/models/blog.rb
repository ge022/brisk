class Blog < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates_presence_of :title, :author, :content

  validate :is_valid_datetime

  def is_valid_datetime
    errors.add(:published_date, 'must be a valid datetime') unless (DateTime.parse(published_date.to_s) rescue false)
  end

  paginates_per 10


end
