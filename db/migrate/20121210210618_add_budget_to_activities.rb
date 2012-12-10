class AddBudgetToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :budget, :integer
  end
end
