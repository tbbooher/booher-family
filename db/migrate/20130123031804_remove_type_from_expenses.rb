class RemoveTypeFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :type
  end
end
