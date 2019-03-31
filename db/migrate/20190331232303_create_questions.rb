class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :options
      t.string :title
      t.text :next_question
      t.boolean :can_skip

      t.timestamps
    end
  end
end
