class AddQuestionQueueToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :question_queue, :string
  end
end
