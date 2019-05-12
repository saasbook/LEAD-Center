class ChangeEthnicityToBeTextInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :ethnicity, :text
  end
end
