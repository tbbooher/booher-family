class AddReferencesToTrips < ActiveRecord::Migration
  def change
    add_column :trip_meals, :trip_day_id, :integer
    add_index  :trip_meals, :trip_day_id
    remove_column :trip_meals, :user_id, :integer
    add_column :trip_days, :trip_id, :integer
    add_index :trip_days, :trip_id
    # remove_index :trip_meals, :user_id
  end
end
