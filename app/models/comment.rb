class Comment < ActiveRecord::Base
  include Voteable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
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
