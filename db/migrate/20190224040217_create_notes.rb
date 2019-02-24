class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :owner_id
      t.string :title
      t.text :body
      t.integer :category_id

      t.timestamps
    end
  end
end
