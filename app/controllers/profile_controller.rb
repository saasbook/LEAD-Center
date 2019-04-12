class ProfileController < ApplicationController

  skip_before_action :verify_authenticity_token

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
    @profile.update_attribute(:first_name, params[:first_name])
    @profile.update_attribute(:last_name, params[:last_name])
    @profile.update_attribute(:major, params[:major])
    @profile.update_attribute(:gender, params[:gender])
    @profile.update_attribute(:grad_year, params[:grad_year])
    @profile.update_attribute(:ethnicity, params[:ethnicity])
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
    redirect_to show_path
  end
end
