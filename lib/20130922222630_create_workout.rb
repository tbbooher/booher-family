class CreateWorkout < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.time :workout_start_time
      t.time :workout_end_time
      t.date :workout_date
      t.integer :location

      t.timestamps
    end
  end

end
