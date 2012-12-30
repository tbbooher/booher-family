class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.float :rom
      t.float :weight

      t.timestamps
    end
  end
end
