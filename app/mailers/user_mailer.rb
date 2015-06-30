class UserMailer < ApplicationMailer
  default from: "admin@haxxor.com"
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end
end
