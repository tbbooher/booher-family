class AddPaidToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :paid, :boolean
  end
end
