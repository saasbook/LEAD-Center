require 'rails_helper'

RSpec.describe ResponseController, type: :controller do

  describe 'GET new' do
    it 'assigns @response' do
      get :new, xhr: true # xhr allows remote requests, format js
      expect(assigns(:response)).not_to be_nil
    end
  end

  describe 'POST create' do
    fixtures :all

    it 'flashes alert' do
      allow_any_instance_of(Response).to receive(:save).and_return(false)
      post :create, format: :js, params: {:question_id => 1, :quiz_id => 1, :selected_options => ['Academic']}
      expect(flash[:alert]).to eq 'There was a problem answering question. Please try again.'
    end
  end
end
