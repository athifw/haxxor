class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user, :voteable, presence: true

  scope :for_user, -> (user) {where(user_id: user.id)}

  def upvote?
    score == 1
  end

  def downvote?
    score == -1
  end
end
