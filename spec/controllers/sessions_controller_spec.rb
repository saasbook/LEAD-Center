require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:cas]
  end

  describe 'POST create' do

    it 'creates a user' do
      expect {post :create, params: { provider: :cas }}.to change{ User.count }.by(1)
    end

    it "creates a session" do
      expect(session[:user_id]).to be_nil
      post :create, params: { provider: :cas }
      expect(session[:user_id]).not_to be_nil
    end

    it "redirects to the profile page" do
      post :create, params: { provider: :cas }
      expect(response).to redirect_to edit_profile_path(session[:user_id])
    end
  end

  describe "Sign out" do

    before do
      post :create, params: { provider: :cas }
    end

    it "resets the session" do
      expect(session[:user_id]).not_to be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

  end

  describe "unsuccessful login" do

    it "failes to authenticate" do
      get :failure
      expect(session[:logged_in]).to be_falsey
      expect(response).to redirect_to root_url
    end

  end



end