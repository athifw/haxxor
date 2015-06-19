class Article < ActiveRecord::Base
  validates :title, :url, :author, :published_at, presence: true  

  def to_s
    title
  end
end
