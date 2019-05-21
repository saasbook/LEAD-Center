class ChangeColumnName < ActiveRecord::Migration[5.2]
  def up
    add_column :responses, :categories, :text
  end
  def down
    remove_column :responses, :category
  end
end
