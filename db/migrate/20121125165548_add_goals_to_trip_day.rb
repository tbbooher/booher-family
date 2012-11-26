class AddGoalsToTripDay < ActiveRecord::Migration
  def change
    add_column :trip_days, :goal, :string
  end
end
