class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.datetime :date
      t.integer :category

      t.timestamps
    end
  end
end
