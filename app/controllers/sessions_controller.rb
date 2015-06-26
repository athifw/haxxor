class SessionsController < ApplicationController
  
  def new
  end

  def create    
    user = User.authenticate(params[:email], params[:password])
    if user  
      self.current_user = user
      redirect_to articles_path, notice: "Welcome #{user}" 
    else
      flash.now[:error] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    self.current_user = nil
    redirect_to articles_path
  end
end