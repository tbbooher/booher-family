class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :workout_date
      t.string :description
      t.float :power
      t.integer :crossfit_workout_id
      t.float :mileage

      t.timestamps
    end
  end
end
