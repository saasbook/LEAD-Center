class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :grad_year
      t.string :major
      t.string :gender
      t.string :ethnicity
      t.boolean :transfer
      t.boolean :graduate
      t.boolean :international

      t.timestamps
    end
  end
end
