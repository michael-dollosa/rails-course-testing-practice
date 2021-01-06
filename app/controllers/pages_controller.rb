class PagesController < ApplicationController
  def home
    #if there is a logged in user, we wanted this controller to redirect user to his article page
    redirect_to articles_path if logged_in?
  end

  def about
  end
end
