class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
     @current_user ||= begin
      id = session[:current_user_id]
      
      if id
        User.find(id)
      end   
    end
  end
  helper_method :current_user

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to articles_path # halts request cycle
    end
  end
  helper_method :require_login
  
  def current_user=(user)
    session[:current_user_id] = user.try(:id)
    @current_user = user
  end

end
