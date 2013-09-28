class Exertion < ActiveRecord::Base
  attr_accessible :distance, :exercise_id, :journal_entry_id, :reps, :time, :weight, :exercise_name, :duration

  belongs_to :journal_entry
  belongs_to :exercise

  def exercise_name
    exercise.try(:name)
  end

  def exercise_name=(name)
    self.exercise = Exercise.find_or_create_by_name(name) if name.present?
  end

  def duration
    # display this
    total_seconds = self.time.to_f
    seconds = total_seconds % 60
    minutes = (total_seconds / 60) % 60
    hours = total_seconds / (60 * 60)

    format("%02d:%02d:%02d", hours, minutes, seconds) #=> "01:00:00"
  end

  def duration=(time)
    self.time = ChronicDuration.parse(time)
  end



end
