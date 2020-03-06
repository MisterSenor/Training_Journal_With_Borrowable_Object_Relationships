class SessionsController < ApplicationController


  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif
      !@user
      flash[:message] = "You need to sign up as a user before you can log in."
      redirect_to signup_path
    else
      flash[:message] = "Sorry, please try again."
      redirect_to login_path
    end
  end

  def index
  end

  
  def destroy
    session.clear
    redirect_to root_path
  end



end
