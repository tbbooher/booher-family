class TimeSlot < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user
  has_many :events

  attr_accessible :friday, :monday, :saturday, :starts_at, :sunday, :thursday, :title, :tuesday, :wednesday

end
