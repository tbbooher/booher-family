class CreateExpenseTrackerVendors < ActiveRecord::Migration
  def change
    create_table :expense_tracker_vendors do |t|
      t.string :name

      t.timestamps
    end
  end
end
