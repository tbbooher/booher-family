class AddWeekIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expense_tracker_daily_expenses, :week_id, :integer
  end
end
