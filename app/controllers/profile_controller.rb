class ProfileController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    User.create!(params[:user])
    redirect_to show_profile_path
  end

  def show
      id = params[:id]
      @profile = User.find(id)
      @id = id
      session[:id] = id
  end

  def edit
    @profile = User.find(session[:id])
    @id = session[:id]
  end

  def update
    @profile = User.find(params[:id])
    @profile.update_attributes!(user_params)
    if params[:transfer]
      @profile.update_attribute(:transfer, true)
    else
      @profile.update_attribute(:transfer, false)
    end
    if params[:graduate]
      @profile.update_attribute(:graduate, true)
    else
      @profile.update_attribute(:graduate, false)
    end
    if params[:international]
      @profile.update_attribute(:international, true)
    else
      @profile.update_attribute(:international, false)
    end
    redirect_to show_profile_path
  end
  private
  def user_params
      params.permit(:first_name, :last_name, :major, :gender, :grad_year, :ethnicity, :transfer, :graduate, :international)
    end
end
