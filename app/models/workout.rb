class Workout < ActiveRecord::Base
  attr_accessible :crossfit_workout_id, :description, :mileage, :power, :workout_date, :reps_attributes, :total_time
  belongs_to :crossfit_workout
  belongs_to :user

  has_many :exercises, through: :reps
  has_many :reps
  accepts_nested_attributes_for :reps

  # date     "workout_date"
  # string   "description"
  # float    "power"
  # integer  "crossfit_workout_id"
  # float    "mileage" # think this should be in the rep ('distance')
  # integer  "user_id"

  # timestamps

  def computed_power
    self.reps{|r| r.power}.inject(:+)
  end

end
