class AddExpenseDetails < ActiveRecord::Migration
  def change
    add_column :expenses, :payer, :integer
    add_column :expenses, :type, :integer
    add_column :expenses, :description, :text
  end
end
