require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  describe 'GET new' do
    it 'assigns @quiz' do
      get :new # xhr allows remote requests, format js
      expect(assigns(:quiz)).not_to be_nil
    end
  end

  describe 'GET quiz' do
    before :each do
      Question.create(
        title: 'Are you interested in Athletics?',
        options: {
          'yes' => ['Sports', 'Wellness', 'Outdoors'],
          'no' => ['Food', 'Indoors']
        },
        next_question: {
          'yes' => 2,
          'no' => 2
        },
        can_skip: false
      )
      Quiz.create(current_question: 1)
    end

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
end
