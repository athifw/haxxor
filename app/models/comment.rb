class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  validates :user, :commentable, presence: true

  def to_s
    text.to_s
  end

  def article
    if commentable.is_a?(Article)
      commentable
    else
      commentable.article
    end
  end
end
