class User < ActiveRecord::Base
  has_secure_password
  validates :title, :email, presence: true

  def to_s
    title
  end
end
