class AddCurrentQuestionToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :current_question, :integer
  end
end
