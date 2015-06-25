class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true

  def to_s
    username
  end
end
