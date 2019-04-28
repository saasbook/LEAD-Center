class AddQuestionTypeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :question_type, :string
    remove_column :questions, :can_skip, :boolean
  end
end
