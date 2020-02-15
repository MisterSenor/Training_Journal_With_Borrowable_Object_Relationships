class UsersController < ApplicationController
before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      render :show
    else
      flash[:message] = "You are not allowed to view other users' information."
      redirect_to user_path(current_user)
    end
  end

  def index
    @users = User.all
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
