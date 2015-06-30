class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.send_password_reset_token
      UserMailer.password_reset(user).deliver_now
    end
    redirect_to new_session_path, notice: "Email sent with password reset instructions."
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password &crarr; 
        reset has expired."
    elsif @user.update_attributes(reset_params)
      redirect_to new_session_url, notice: "Password has been reset."
    else
      render :edit
    end
  end

  private
  def reset_params
    params[:user].permit(:password, :password_confirmation)
  end
end
