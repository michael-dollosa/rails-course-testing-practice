class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def show
    # get the email from URL-parameters or what have you and make lowercase
    email_address = @user.email.downcase
    
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    
    # compile URL which can be used in <img src="RIGHT_HERE"...
    @user_image = "https://www.gravatar.com/avatar/#{hash}?s=200"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registered successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end