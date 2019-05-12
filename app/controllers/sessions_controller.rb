class SessionsController < ApplicationController


  def create
    auth = request.env['omniauth.auth']
    @user = User.where(:uid => auth['uid'].to_s).first || User.create_new_user(auth)
    reset_session
    session[:user_id] = @user.id
    session[:ticket] = auth[:credentials][:ticket]
    session[:auth] = auth
    session[:logged_in] = true
    redirect_to root_url
  end

  def failure
    session[:logged_in] = false
    flash[:message] = "Authentication failed."
    redirect_to root_url
  end

  def signin
    redirect_to "/auth/cas"
  end

  def destroy
    reset_session
    redirect_to "https://auth.berkeley.edu/cas/logout"
  end

end