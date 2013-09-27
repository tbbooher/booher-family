class Exertion < ActiveRecord::Base
  attr_accessible :distance, :exercise_id, :journal_entry_id, :reps, :time, :weight

  belongs_to :journal_entry
  belongs_to :exercise

end
