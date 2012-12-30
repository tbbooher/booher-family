class AddCaloriesPerHourToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :calories_per_hour, :float
  end
end
