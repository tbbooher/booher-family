class Location < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :name, :address
  has_many :trips
  has_many :trip_days
  has_many :trip_meals

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

end
