class Activity < ActiveRecord::Base
  attr_accessible :description, :location_id, :name, :trip_day_id, :budget, :budget_cents, :activity_type

  belongs_to :trip_day
  belongs_to :location

  # add type
  TYPE = {1 => :lodging, 2 => :tour, 3 => :transportation, 4 => :fitness, 5 => :other}
  #MEALS = {1 => :breakfast, 2 => :lunch, 3 => :dinner, 4 => :snack}

  monetize :budget_cents

  def the_location
    if self.location
      self.location.name
    else
      "no location specified"
    end
  end

  def type_name
    TYPE[self.activity_type].to_s
  end
end
