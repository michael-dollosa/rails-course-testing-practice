module ApplicationHelper

  #return the details of the current user logged in
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
end
