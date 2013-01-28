class AddSonshipClassIdToSonshipLessons < ActiveRecord::Migration
  def change
    add_column :sonship_lessons, :sonship_class_id, :integer
  end
end
