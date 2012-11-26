class AddLocationIdToTripMealsAndTripDays < ActiveRecord::Migration
  def change
    add_column :trip_days, :location_id, :integer
    add_index :trip_days, :location_id
    add_column :trip_meals, :location_id, :integer
    add_index :trip_meals, :location_id
    remove_column :trip_days, :location
    remove_column :trip_days, :loc_lat
    remove_column :trip_days, :loc_lon
  end
end
