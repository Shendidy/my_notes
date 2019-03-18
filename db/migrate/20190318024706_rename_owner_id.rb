class RenameOwnerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :owner_id, :user_id
  end
end
