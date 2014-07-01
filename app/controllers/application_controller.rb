class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user, :require_logged_in, :owns_circle?
  
  def login(user)
    session[:session_token] = user.reset_session_token
    @current_user = user
  end
  
  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_logged_in
   redirect_to new_session_url unless logged_in?
  end
  
  def owns_circle?(circle)
    current_user.owned_circles.include?(circle)
  end
 
end
