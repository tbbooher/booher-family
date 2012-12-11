class AddCurrencyToMoneyModels < ActiveRecord::Migration
  def change
    add_column :trip_meals, :currency, :string
    add_column :activities, :currency, :string
  end
end
