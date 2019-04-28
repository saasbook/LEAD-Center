require 'rails_helper'

RSpec.describe Quiz, type: :model do
  context 'validation tests' do
    it 'ensures current question presence on initialization' do
      quiz = Quiz.new().save
      expect(quiz).to eq(false)
    end
  end

  context 'Get Content Method' do
    fixtures :all

    before :each do
      @quiz = quizzes(:quiz_1)
      Response.new({
        :question_id => 1,
        :quiz_id => 1,
        :content => ['Academic', 'Campus Departments', 'Departmental Organizations', 'Professional'],
        :is_category => true
      }).save
      Response.new({
        :question_id => 2,
        :quiz_id => 1,
        :content => ['Academic','Advocacy','Environmental', 'Social Activism', 'Sustainability'],
        :is_category => false
      }).save
    end

    it 'returns correct categories and interests' do
      expected_content = {
        :categories => Set.new(['Academic', 'Campus Departments', 'Departmental Organizations', 'Professional']),
        :interests => Set.new(['Academic','Advocacy','Environmental', 'Social Activism', 'Sustainability'])
      }
      quiz_content = @quiz.get_content
      expect(quiz_content).to eq(expected_content)
    end
  end
end
