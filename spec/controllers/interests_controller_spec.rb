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
  
  describe 'POST upload' do
	
	it 'discards empty uploads' do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:" + Figaro.env.admin_pw)
	  expect_any_instance_of(InterestsController).not_to receive(:save_csv)
	  post 'upload'
	end
	
	it 'discards incorrectly formatted csvs' do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:" + Figaro.env.admin_pw)
	  #badfile = fixture_file_upload('bad.csv', 'text/csv')
	  expect_any_instance_of(InterestsController).not_to receive(:save_csv)
	  post 'upload',  params: {csv_file: fixture_file_upload('bad.csv', 'text/csv') }
	end
  end
end
