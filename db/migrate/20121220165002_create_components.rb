class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.decimal :length_in_inches
      t.decimal :weight_per_inch
      t.decimal :component_weight

      t.timestamps
    end
  end
end
