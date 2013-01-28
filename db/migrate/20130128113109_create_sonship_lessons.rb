class CreateSonshipLessons < ActiveRecord::Migration
  def change
    create_table :sonship_lessons do |t|
      t.date :start_date
      t.string :title
      t.text :goals
      t.text :impact
      t.text :memory_verse

      t.timestamps
    end
  end
end
