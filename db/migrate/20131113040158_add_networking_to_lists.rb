class AddNetworkingToLists < ActiveRecord::Migration
  def change
    add_column :journal_entries, :networking, :text
  end
end
