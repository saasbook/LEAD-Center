class ProfileController < ApplicationController

  skip_before_action :verify_authenticity_token

  def show
      id = params[:id]
      @profile = Profile.find(id)
      @id = id
      session[:id] = id
  end

  def edit
    @profile = Profile.find(session[:id])
    @id = session[:id]
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attribute(:firstname, params[:firstname])
    @profile.update_attribute(:lastname, params[:lastname])
    @profile.update_attribute(:major, params[:major])
    @profile.update_attribute(:gender, params[:gender])
    @profile.update_attribute(:schoolyear, params[:schoolyear])
    flash[:notice] = "profile was successfully updated."
    redirect_to show_path
  end
end
