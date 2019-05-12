class ProfileController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    set_params
    if @profile.update_attributes(user_params)
      redirect_to show_profile_path
    else
      flash[:alert] = 'There was a problem updating your profile.'
      redirect_to edit_profile_path(params[:id])
    end
  end

  private

  def user_params
      params.permit(:first_name, :last_name, :major, :gender, :grad_year, :transfer, :graduate, :international, :ethnicity => [])
    end
  def set_params
    if params[:gender]
      params[:gender] = params[:gender].titleize
    end
    [:transfer, :graduate, :international].each do |field|
      params[field] = false unless params[field]
    end
  end
end
