class Activity < ActiveRecord::Base
  attr_accessible :description, :location_id, :name, :trip_day_id

  belongs_to :trip_day
  belongs_to :location
end
