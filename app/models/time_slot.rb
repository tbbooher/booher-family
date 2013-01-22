class TimeSlot < ActiveRecord::Base

  belongs_to :user
  has_many :events

  attr_accessible :friday, :monday, :saturday, :starts_at, :sunday, :thursday, :title, :tuesday, :wednesday, :ends_at, :event_type_id

  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validates :title, presence: true

  def event_type_name
    unless self.event_type_id.nil?
      Event::TYPES[self.event_type_id]
    else
      "none"
    end
  end

end
