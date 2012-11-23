class Event < ActiveRecord::Base
  belongs_to :time_slot
  belongs_to :event_type
  belongs_to :user
  attr_accessible :all_day, :description, :ends_at, :starts_at, :title, :time_slot_id, :event_type_id, :user_id
end
