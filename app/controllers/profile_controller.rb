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
    @profile = User.find(params[:id])
    @id = params[:id]
  end

  def update
    @profile = User.find(params[:id])
    @profile.update_attributes!(user_params)
    @profile.update_attribute(:transfer, params[:transfer] ? true : false)
    @profile.update_attribute(:graduate, params[:graduate] ? true : false)
    @profile.update_attribute(:international, params[:international] ? true : false)
    redirect_to show_profile_path
  end
  private
  def user_params
      params.permit(:first_name, :last_name, :major, :gender, :grad_year, :ethnicity, :transfer, :graduate, :international)
    end
end
