class ApplicationController < ActionController::Base

  helper_method :correct_user?

  def authenticate_user!
    current_user ||= User.find(session[:user_id]) if session[:user_id]
    if !current_user
      redirect_to root_url
    end
  end

  def correct_user?
    current_user ||= User.find(session[:user_id]) if session[:user_id]
    @user = User.find(params[:id])
    return current_user == @user
  end

end
