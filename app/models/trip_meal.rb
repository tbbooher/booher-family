class TripMeal < ActiveRecord::Base

  attr_accessible :budget, :link, :location, :meal, :place, :trip_day_id, :location_id, :description, :budget_cents
  belongs_to :trip_day
  belongs_to :location

  monetize :budget_cents

  MEALS = {1 => :breakfast, 2 => :lunch, 3 => :dinner, 4 => :snack}

  validates :meal, presence: true

  def meal_name
    MEALS[self.meal].to_s
  end
end
