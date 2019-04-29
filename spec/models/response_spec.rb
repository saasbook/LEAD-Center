require 'rails_helper'

RSpec.describe Response, type: :model do
  context 'validation tests' do
    fixtures :all

    it 'ensures question_id presence on creation' do
      response = Response.new(quiz_id: 1, content: ['Sports', 'Greek']).save
      expect(response).to eq(false)
    end

    it 'ensures quiz_id presence on creation' do
      response = Response.new(question_id: 1, content: ['Sports', 'Greek']).save
      expect(response).to eq(false)
    end

    it 'ensures content presence on creation' do
      response = Response.new(quiz_id: 1, question_id: 1).save
      expect(response).to eq(false)
    end

    it 'ensures response created when all fields present' do
      response = Response.new(quiz_id: 1, question_id: 1, content: ['Sports', 'Greek']).save
      expect(response).to eq(true)
    end
  end
end
