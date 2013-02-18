class CreateExpenseTrackerWeeks < ActiveRecord::Migration
  def change
    create_table :expense_tracker_weeks do |t|
      t.date :start_date
      t.money :total_spent

      t.timestamps
    end
  end
end
