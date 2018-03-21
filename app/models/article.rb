class Article < ApplicationRecord

  validates_presence_of :title, :author,
                        :published_date,
                        :content, :avatar_thumbnail

  paginates_per 10

  after_save do |article|
    if article.published
      User.where(newsletter: true).each do |user|
        UserMailer.article_email(user, article).deliver_now
      end
    end
  end

end
