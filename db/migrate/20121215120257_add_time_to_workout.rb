class AddTimeToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :total_time, :decimal
  end
end
