class CreateTripMeals < ActiveRecord::Migration
  def change
    create_table :trip_meals do |t|
      t.integer :meal
      t.string :location
      t.string :link
      t.integer :budget
      t.references :user

      t.timestamps
    end
    add_index :trip_meals, :user_id
  end
end
