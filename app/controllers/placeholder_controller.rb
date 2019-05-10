class PlaceholderController < ApplicationController

  #before_action :get_game_from_session
  #after_action  :store_game_in_session
  
  public
  
  def landing
    if session[:logged_in]
      redirect_to root_path
    end
  end
  
  def login
    session[:logged_in] = true
    redirect_to root_path
  end
  
  def home
    if not session[:logged_in]
      redirect_to landing_path
    end
    @showAllOrgs = true
  end

  def generate_orgs
    quiz_results = Quiz.find(params[:quiz_id]).get_content
    #here are the interests and categories needed for the API call
    #i.e to get interests: quiz_results[:interests]
    
    @organizations = Organization.get_organizations(12, quiz_results[:categories], quiz_results[:interests])
    @showAllOrgs = false
    #melvin
    respond_to do |format|
      if @organizations.nil?
        format.html
      else
        format.js
        format.html
      end
    end
  end
end
