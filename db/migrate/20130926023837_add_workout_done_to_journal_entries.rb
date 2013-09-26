class AddWorkoutDoneToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :workout_done, :text
  end
end
