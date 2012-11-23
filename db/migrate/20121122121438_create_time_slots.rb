class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.string :title
      t.references :event_type
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.references :user
      t.time :starts_at
      t.time :ends_at

      t.timestamps
    end
    add_index :time_slots, :event_type_id
    add_index :time_slots, :user_id
  end
end
