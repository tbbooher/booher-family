class RemoveCaloriesPerHourFromExercise < ActiveRecord::Migration
  def change
    remove_column :exercises, :calories_per_hour
  end
end
