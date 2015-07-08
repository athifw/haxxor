class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user, :voteable, presence: true

  scope :for_user, -> (user) {where(user_id: user.id)}
end
