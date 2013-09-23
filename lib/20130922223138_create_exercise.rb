class CreateExercise < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.time :time
      t.reps :integer
      t.distance :decimal
      t.decimal :weight

      t.timestamps
    end
  end
end
