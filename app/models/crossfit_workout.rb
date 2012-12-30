class CrossfitWorkout < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :workouts
end
