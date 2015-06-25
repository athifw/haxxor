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

  def current_user=(user)
    session[:current_user_id] = user.try(:id)
    @current_user = user
  end

end
