class MakeUsernameNotNullable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :user_name, :string, :null => false
  end
end
