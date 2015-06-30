class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true

  def to_s
    username
  end

  def self.authenticate(email, password)
    find_by(email: email).try(:authenticate, password)
  end

  # def generate_token(column)
  #   begin
  #     self[column] = SecureRandom.urlsafe_base64
  #   end while User.exists?(column: self[column])
  # end

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!    
  end
end
