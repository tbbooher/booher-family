class EventType < ActiveRecord::Base
  attr_accessible :name

  has_many :events
  has_many :time_slots

  validates :name, presence: true, length: {minimum: 2 }

end
