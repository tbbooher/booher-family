class CreateSonshipClasses < ActiveRecord::Migration
  def change
    create_table :sonship_classes do |t|
      t.date :start_date
      t.integer :user_id

      t.timestamps
    end
  end
end
