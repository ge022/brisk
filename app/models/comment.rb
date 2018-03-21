class Comment < ApplicationRecord
  belongs_to :blog

  validates_presence_of :blog_id, :author, :content
  validates_inclusion_of :rating, in: 1..5
end
