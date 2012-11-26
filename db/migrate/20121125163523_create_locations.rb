class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :loc_lat
      t.decimal :loc_lon
      t.text :description

      t.timestamps
    end
  end
end
