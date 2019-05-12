require 'rails_helper'

RSpec.describe InterestsController, type: :controller do

  describe 'GET index' do

    it 'refuses incorrect credentials' do
      get 'index'
	  expect(response).to have_http_status(401)
    end
	
    it 'accepts correct credentials' do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:" + Figaro.env.admin_pw)
      get 'index'
	  expect(response).to have_http_status(200)
    end
  end
end
