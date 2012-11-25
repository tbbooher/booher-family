class TimeSlot < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user
  has_many :events

  attr_accessible :friday, :monday, :saturday, :starts_at, :sunday, :thursday, :title, :tuesday, :wednesday, :ends_at, :user_id, :event_type_id

  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validates :title, presence: true

end
