class SessionsController < ApplicationController


  def create
    auth = request.env['omniauth.auth']
    @user = User.where(:uid => auth['uid'].to_s).first
    new_user = false
    if @user.nil?
      @user = User.create_new_user(auth)
      new_user = true
    end
    reset_session
    session[:user_id] = @user.id
    session[:ticket] = auth[:credentials][:ticket]
    session[:auth] = auth
    session[:logged_in] = true
    if new_user
      redirect_to controller: 'profile', action: 'edit', id: @user.id
    else
      redirect_to root_url
    end
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