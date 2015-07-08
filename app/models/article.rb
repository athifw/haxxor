class Article < ActiveRecord::Base
  validates :title, :url, :user, presence: true  
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def to_s
    title
  end
end
