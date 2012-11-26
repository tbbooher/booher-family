class AddPlaceToTripMeals < ActiveRecord::Migration
  def change
    add_column :trip_meals, :place, :string
    add_column :trip_meals, :description, :text
  end
end
