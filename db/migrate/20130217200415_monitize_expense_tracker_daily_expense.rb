class MonitizeExpenseTrackerDailyExpense < ActiveRecord::Migration
  def change
    add_money :expense_tracker_daily_expenses, :amount
  end
end
