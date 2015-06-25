class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true

  def to_s
    username
  end

  def self.authenticate(email, password)
    find_by(email: email).try(:authenticate, password)
  end
end
