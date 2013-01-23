class AddMoneyToExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :amount
    add_money :expenses, :amount
  end
end
