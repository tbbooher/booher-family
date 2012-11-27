class Location < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :name, :address
  has_many :trips
  has_many :trip_days
  has_many :trip_meals

  geocoded_by :address
  after_validation :geocode, if: -> { self.address_changed? }

  acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    self.address
  end

end
