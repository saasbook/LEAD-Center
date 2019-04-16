require 'rails_helper'

RSpec.describe Quiz, type: :model do
  context 'validation tests' do
    it 'ensures current question presence on initialization' do
      quiz = Quiz.new().save
      expect(quiz).to eq(false)
    end
  end
end
