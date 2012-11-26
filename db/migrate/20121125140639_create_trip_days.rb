class CreateTripDays < ActiveRecord::Migration
  def change
    create_table :trip_days do |t|
      t.date :day_date
      t.string :lodging
      t.string :lodging_link
      t.string :location
      t.decimal :loc_lat
      t.decimal :loc_lon
      t.string :notes

      t.timestamps
    end
  end
end
