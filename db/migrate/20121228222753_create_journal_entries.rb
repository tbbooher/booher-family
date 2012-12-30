class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.date :entry_date
      t.string :description
      t.integer :purity
      t.boolean :lack_of_discipline
      t.integer :fitness
      t.integer :devotional
      t.integer :chrissy
      t.integer :relational
      t.integer :discipline
      t.integer :facepicking
      t.integer :stress
      t.boolean :sick
      t.boolean :flossed
      t.boolean :workout
      t.string :health_statement
      t.string :to_do
      t.string :memory_verse
      t.string :friends_in_focus
      t.string :problem_of_the_day
      t.boolean :problem_attempted
      t.boolean :problem_solved

      t.timestamps
    end
  end
end
