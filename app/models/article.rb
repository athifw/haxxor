class Article < ActiveRecord::Base
  validates :title, :url, :author, presence: true  

  def to_s
    title
  end
end
