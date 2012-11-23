class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :starts_at
      t.date :ends_at
      t.boolean :all_day
      t.text :description
      t.references :time_slot
      t.references :event_type
      t.references :user

      t.timestamps
    end
    add_index :events, :time_slot_id
    add_index :events, :event_type_id
    add_index :events, :user_id
  end
end
