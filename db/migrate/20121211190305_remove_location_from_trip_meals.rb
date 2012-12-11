class RemoveLocationFromTripMeals < ActiveRecord::Migration
  def change
    remove_column :trip_meals, :location
  end
end
