class Activity < ActiveRecord::Base
  attr_accessible :description, :location_id, :name, :trip_day_id, :budget, :budget_cents

  belongs_to :trip_day
  belongs_to :location

  monetize :budget_cents

  def the_location
    if self.location
      self.location.name
    else
      "no location specified"
    end
  end
end
