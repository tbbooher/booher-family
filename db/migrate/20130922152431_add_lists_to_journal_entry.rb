class AddListsToJournalEntry < ActiveRecord::Migration
  def change
    add_column :journal_entries, :at_work, :text
    add_column :journal_entries, :at_home, :text
    add_column :journal_entries, :at_home_pc, :text
    add_column :journal_entries, :someday_maybe, :text
    add_column :journal_entries, :blog_post_ideas, :text
    add_column :journal_entries, :friends, :text
  end
end
