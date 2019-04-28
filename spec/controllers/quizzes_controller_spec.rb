require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  describe 'GET new' do
    it 'assigns @quiz' do
      get :new # xhr allows remote requests, format js
      expect(assigns(:quiz)).not_to be_nil
    end
  end

  describe 'GET quiz' do
    fixtures :all

    it 'finds and assigns @quiz' do
      get :quiz # xhr allows remote requests, format js
      expect(assigns(:quiz)).not_to be_nil
    end

    it 'assigns @question' do
      get :quiz # xhr allows remote requests, format js
      expect(assigns(:question)).not_to be_nil
    end

    it 'assigns @response' do
      get :quiz # xhr allows remote requests, format js
      expect(assigns(:response)).not_to be_nil
    end
  end

  describe 'POST create' do
    fixtures :all

    it 'flashes alert' do
      allow_any_instance_of(Quiz).to receive(:save).and_return(false)
      post :create, format: :js
      expect(flash[:alert]).to eq 'There was a problem creating quiz.'
    end
  end
end
