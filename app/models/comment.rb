class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :user, :commentable, presence: true

  def to_s
    text.to_s
  end
end
