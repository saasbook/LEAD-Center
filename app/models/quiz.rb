class Quiz < ApplicationRecord
  has_many :responses
  serialize :question_queue, Array

  validates :current_question, presence: true
  def update_quiz_state(question_ids)
    self.question_queue = self.question_queue.concat question_ids
    self.current_question = self.question_queue.shift
    self.save
    return self.current_question
  end

  def get_content
    categories = Set.new
    interests = Set.new
    self.responses.each do |response|
      if response.is_category
        categories.merge(response.content)
      else
        interests.merge(response.content)
      end
    end
    return {:categories => categories, :interests => interests}
  end
end
