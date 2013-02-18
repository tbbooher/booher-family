class CreateExpenseTrackerCategories < ActiveRecord::Migration
  def change
    create_table :expense_tracker_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
