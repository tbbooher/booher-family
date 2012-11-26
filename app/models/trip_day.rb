class TripDay < ActiveRecord::Base
  attr_accessible :day_date, :lodging, :lodging_link, :notes, :goal, :location_id

  belongs_to :trip
  belongs_to :location

  has_many :trip_meals

  def title
    self.day_date.to_s(:shorty)
  end
end
