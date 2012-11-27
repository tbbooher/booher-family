class ChangeNoteForTripDay < ActiveRecord::Migration
  def change
    remove_column :trip_days, :notes
    add_column :trip_days, :notes, :text
  end
end
