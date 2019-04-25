class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create #TODO

  def create
    auth = auth_hash
    @user = User.where(:uid => auth['uid'].to_s).first || User.create_new_user(auth)
    reset_session
    session[:user_id] = @user.id
    session[:logged_in] = true
    redirect_to root_url
  end

  def failure
    session[:logged_in] = false
    redirect_to root_url, :flash => "Authentication error"
  end

  def signin
    redirect_to "/auth/cas"
  end

  def signout
    reset_session
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end