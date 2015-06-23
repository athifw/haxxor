class UsersController < ApplicationController
  def new
    @user = Users.new
  end

  def create
    @user = Users.new(user_params)
    if @user.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private
  def user_params
    params[:user].permit(:name, :email, :password_digest)
  end
end
