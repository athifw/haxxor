class Article < ActiveRecord::Base
  include Voteable
  validates :title, :url, :user, presence: true  
  belongs_to :user
  has_many :comments, as: :commentable

  def to_s
    title
  end

  def article
    self
  end
end
