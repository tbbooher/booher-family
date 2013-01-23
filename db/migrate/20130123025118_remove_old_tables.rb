class RemoveOldTables < ActiveRecord::Migration
  def change
    drop_table :time_slots
    drop_table :event_types
    remove_column :events, :time_slot_id
    remove_column :events, :user_id
  end
end
