class ApplicationController < ActionController::Base
  #all methods created under ApplicationController can be used by other controller

  #to make this method also available in our views, we use helper_method
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #breaking down this line:
    #if we already have current user before, then return @current user - this is memoization
    #if not, then check if session[:user_id] is present in db
    #if yes, then find User obj related to the id
  end

  def logged_in?
    #check if current user exist by turning current user to bool using !!
    !!current_user
  end

  #method for controller to only use some methods for logged in users
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform the action"
      redirect_to login_path
    end
  end
end
