require 'rails_helper'

RSpec.describe Response, type: :model do
  context 'validation tests' do
    before :each do
      Question.create(title: 'Are you interested in Athletics?',
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

    it 'ensures question_id presence on creation' do
      response = Response.new(quiz_id: 1, categories: ['Sports', 'Greek']).save
      expect(response).to eq(false)
    end

    it 'ensures quiz_id presence on creation' do
      response = Response.new(question_id: 1, categories: ['Sports', 'Greek']).save
      expect(response).to eq(false)
    end

    it 'ensures categories presence on creation' do
      response = Response.new(quiz_id: 1, question_id: 1).save
      expect(response).to eq(false)
    end

    it 'ensures response created when all fields present' do
      response = Response.new(quiz_id: 1, question_id: 1, categories: ['Sports', 'Greek']).save
      expect(response).to eq(true)
    end
  end
end
