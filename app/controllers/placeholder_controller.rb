class PlaceholderController < ApplicationController
  
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
	@id = session[:user_id]
    @showAllOrgs = true
  end

  def generate_orgs
    quiz_results = Quiz.find(params[:quiz_id]).get_content
    #here are the interests and categories needed for the API call
    #i.e to get interests: quiz_results[:interests]
    
    @organizations = Organization.get_organizations(12, quiz_results[:categories], quiz_results[:interests])
    @showAllOrgs = false
    respond_to do |format|
      if @organizations.nil?
        format.js { flash[:alert] = 'There was a problem matching with organizations.' }
      else
        format.js
        format.html
      end
    end
  end
end
