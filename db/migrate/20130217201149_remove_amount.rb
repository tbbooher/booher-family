class RemoveAmount < ActiveRecord::Migration
  def change
    remove_column :expense_tracker_daily_expenses, :amount
  end
end
