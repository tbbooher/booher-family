class Location < ActiveRecord::Base
  attr_accessible :description, :loc_lat, :loc_lon, :name
  has_many :trips
  has_many :trip_days
  has_many :trip_meals

end
