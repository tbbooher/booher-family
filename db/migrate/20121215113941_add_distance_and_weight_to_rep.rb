class AddDistanceAndWeightToRep < ActiveRecord::Migration
  def change
    add_column :reps, :distance, :float
    add_column :reps, :weight, :float
  end
end
