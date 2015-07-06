class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :user, :article, presence: true

  def to_s
    text.to_s
  end
end
