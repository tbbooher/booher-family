class AddGoals < ActiveRecord::Migration
  def change
    add_column :journal_entries, :goals, :text
  end
end
