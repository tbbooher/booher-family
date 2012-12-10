class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :location_id
      t.text :description
      t.integer :trip_day_id

      t.timestamps
    end
  end
end
