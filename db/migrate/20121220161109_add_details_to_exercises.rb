class AddDetailsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :bw_total_weight_moved_1, :decimal
    add_column :exercises, :bw_total_weight_moved_2, :decimal
    add_column :exercises, :bw_distance_moved_1, :decimal
    add_column :exercises, :bw_distance_moved_2, :decimal
    add_column :exercises, :weight_distance_moved, :decimal
    add_column :exercises, :bw_work_done_per_rep, :decimal

    # now users
    add_column :users, :height_in_inches, :decimal
    add_column :users, :weight, :decimal

    # now to clean up
    #remove_column :exercises, :rom
    remove_column :exercises, :weight
    remove_column :exercises, :distance
  end
end
