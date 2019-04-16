require 'rails_helper'

RSpec.describe ResponseController, type: :controller do

  describe 'GET new' do
    it 'assigns @response' do
      get :new, xhr: true # xhr allows remote requests, format js
      expect(assigns(:response)).not_to be_nil
    end
  end
end
