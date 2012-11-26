class CreatePrinciples < ActiveRecord::Migration
  def change
    create_table :principles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
