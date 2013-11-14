class AddTwoFieldsToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :consulting, :text
    add_column :journal_entries, :to_read, :text
  end
end
