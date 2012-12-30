class AddDistanceToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :distance, :float
    remove_column :exercises, :rom
  end
end
