class ChangeLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :loc_lat
    remove_column :locations, :loc_lon
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
