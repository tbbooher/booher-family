class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :budget
      t.integer :total_cost

      t.timestamps
    end
  end
end
