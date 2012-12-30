class CreateCrossfitWorkouts < ActiveRecord::Migration
  def change
    create_table :crossfit_workouts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
