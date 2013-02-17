class CreateExpenseTrackerDailyExpenses < ActiveRecord::Migration
  def change
    create_table :expense_tracker_daily_expenses do |t|
      t.integer :amount
      t.date :date
      t.belongs_to :vendor
      t.belongs_to :category

      t.timestamps
    end
    add_index :expense_tracker_daily_expenses, :vendor_id
    add_index :expense_tracker_daily_expenses, :category_id
  end
end
