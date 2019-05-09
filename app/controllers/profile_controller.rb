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
    if params[:gender] == 'Other'
      params[:gender] = params[:gender_text]
    end
    if @profile.update_attributes!(user_params)
      redirect_to show_profile_path
    else
      binding.pry
      redirect_to edit_profile_path(params[:id])
    end
  end
  private
  def user_params
      params.permit(:first_name, :last_name, :major, :gender, :grad_year, :transfer, :graduate, :international, :ethnicity => [])
    end
end
