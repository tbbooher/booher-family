class CreateLostItems < ActiveRecord::Migration
  def change
    create_table :lost_items do |t|
      t.string :name
      t.references :user
      t.date :date_lost
      t.text :description
      t.integer :priority

      t.timestamps
    end
    add_index :lost_items, :user_id
  end
end
