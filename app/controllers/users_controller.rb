class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:show, :index, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page], per_page: 1)
    
  end
  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log in user upon saving
      session[:user_id] = @user.id
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
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy

    #delete user
    @user.destroy
    #set session id to nil since user is still logged in
    session[:user_id] = nil if @user == current_user #only set session user id to nil if user is the one deleting his own account (not the admin)
    #notice
    flash[:notice] = "Account and all associated articles successfully deleted"
    #redirect
    redirect_to root_path

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own profile"
      redirect_to users_path
    end
    
  end

end