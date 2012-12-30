class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.integer :exercise_id
      t.integer :workout_id
      t.integer :count
      t.float :seconds

      t.timestamps
    end
  end
end
