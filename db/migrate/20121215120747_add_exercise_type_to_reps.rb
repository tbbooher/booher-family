class AddExerciseTypeToReps < ActiveRecord::Migration
  def change
    add_column :reps, :exercise_type, :integer
  end
end
