class Quiz < ApplicationRecord
  has_many :responses

  validates :current_question, presence: true
  def update_quiz_state(queue_content)
    self.question_ids.add(queue_content[:question_ids])
  end

  def get_content
    categories = Set.new
    interests = Set.new
    self.responses.each do |response|
      if response.is_category
        categories.add(response.content)
      else
        interests.add(response.content)
      end
    end
    return {:categories => categories, :interests => interests}
  end
end
