class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.date :due_date
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
