class SessionsController < ApplicationController

  def new
    
  end

  def create
    #find if user email is existing
    user = User.find_by(email: params[:session][:email].downcase)

    #if user is existing and it matches the password
    if user && user.authenticate(params[:session][:password])
      #session - set user as logged in until user logs out
      #session is a Rails Action Controller function
      #in this case, we used :user_id for the session
      session[:user_id] = user.id

      #flash message
      flash[:notice] = "Logged in successfully"

      #redirect to user profile
      redirect_to user
    else
      #error message
      #we use flash.now since we are not redirecting; we are rendering the template
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    #to logout, we just set session[:user_id] to nil
    session[:user_id] = nil
    
    #flash message for logout
    flash[:notice] = "Logged out"

    #redirect to homepage (root)
    redirect_to root_path
  end
end
