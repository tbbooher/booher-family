class CreateSonshipQuestions < ActiveRecord::Migration
  def change
    create_table :sonship_questions do |t|
      t.integer :sonship_lesson_id
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
