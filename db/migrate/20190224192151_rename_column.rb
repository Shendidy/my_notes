class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :owner_id, :user_id
  end
end
