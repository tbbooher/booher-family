class TripDay < ActiveRecord::Base
  attr_accessible :day_date, :lodging, :lodging_link, :notes, :goal, :location_id

  belongs_to :trip
  belongs_to :location

  has_many :trip_meals

  validates :day_date, presence: true
  validates :goal, presence: true
  validates :location_id, presence: true

  #default_scopej
  default_scope order('day_date ASC')

  def title
    self.day_date.to_s(:shorty)
  end

  def description
    if self.goal && self.location
      "#{self.title}: #{self.goal} at #{self.location.name}"
    else
      "#{self.title}"
    end
  end
end
