class AddTextToJournalEntries < ActiveRecord::Migration
  def change
    change_column :journal_entries, :description, :text
    change_column :journal_entries, :to_do, :text
    change_column :journal_entries, :memory_verse, :text
    change_column :journal_entries, :problem_of_the_day, :text
  end
end
