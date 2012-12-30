class ChangeExerciseFieldsToStrings < ActiveRecord::Migration
  def change
    remove_column :exercises, :bw_total_weight_moved_1
    remove_column :exercises, :bw_total_weight_moved_2
    remove_column :exercises, :bw_distance_moved_1
    remove_column :exercises, :bw_distance_moved_2
    remove_column :exercises, :weight_distance_moved
    remove_column :exercises, :bw_work_done_per_rep

    add_column :exercises, :bw_total_weight_moved_1, :string
    add_column :exercises, :bw_total_weight_moved_2, :string
    add_column :exercises, :bw_distance_moved_1, :string
    add_column :exercises, :bw_distance_moved_2, :string
    add_column :exercises, :weight_distance_moved, :string
    add_column :exercises, :bw_work_done_per_rep, :string
  end
end
