class CreateFamilyGoals < ActiveRecord::Migration
  def change
    create_table :family_goals do |t|
      t.string :name
      t.integer :priority
      t.boolean :above_cut
      t.text :description
      t.text :justification

      t.timestamps
    end
  end
end
