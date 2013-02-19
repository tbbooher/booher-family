class AddMemoToDailyExpense < ActiveRecord::Migration
  def change
    add_column :expense_tracker_daily_expenses, :memo, :string
  end
end
