class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true

  def to_s
    title
  end
end
