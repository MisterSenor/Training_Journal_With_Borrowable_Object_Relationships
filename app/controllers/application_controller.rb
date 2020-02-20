class ApplicationController < ActionController::Base

  def current_user
    User.find(session[:user_id]) || User.find_by(id: session[:user_id]) if session[:user_id]
  end

 def logged_in?
   session.include? :user_id
 end


  def require_login
    unless logged_in?
      flash[:message] = "You must be logged in to access this section."
      redirect_to login_path
    end
  end

  helper_method :require_login
  helper_method :current_user

end
