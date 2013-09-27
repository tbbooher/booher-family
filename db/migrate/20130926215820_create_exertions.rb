class CreateExertions < ActiveRecord::Migration
  def change
    create_table :exertions do |t|
      t.integer :journal_entry_id
      t.decimal :weight
      t.integer :reps
      t.decimal :time
      t.decimal :distance
      t.integer :exercise_id

      t.timestamps
    end
  end
end
