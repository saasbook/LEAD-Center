class ChangeCategoriesColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :responses, :categories, :content
    add_column :responses, :is_category, :boolean
  end
end
