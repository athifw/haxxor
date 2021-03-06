class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      self.current_user = @user
      redirect_to articles_path, notice: 'Account created.'
    else
      render :new
    end
  end

  private
  def user_params
    params[:user].permit(:username, :email, :password, :password_confirmation)
  end
end
