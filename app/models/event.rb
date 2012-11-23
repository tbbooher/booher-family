class Event < ActiveRecord::Base
  belongs_to :time_slot
  belongs_to :event_type
  belongs_to :user
  attr_accessible :all_day, :description, :ends_at, :starts_at, :title, :time_slot_id, :event_type_id, :user_id

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  scope :before, lambda {|end_time, user_id| {:conditions => ["ends_at < ? and user_id = ?", Event.format_date(end_time), user_id] }}
  scope :after, lambda {|start_time, user_id| {:conditions => ["starts_at > ? and user_id = ?", Event.format_date(start_time), user_id] }}

  def self.destroy_all_in_month(month_string, user_id)
    date = Date.parse("1-#{month_string}")
    Event.destroy_all(["starts_at >= ? and starts_at < ? and user_id = ?", date.beginning_of_month, date.end_of_month, user_id])
  end

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
        :id => self.id,
        :title => self.title,
        :description => self.description || "",
        :start => starts_at.rfc822,
        :end => ends_at.rfc822,
        :allDay => self.all_day,
        :recurring => false,
        :url => Rails.application.routes.url_helpers.user_event_path(self.user, id),
        :className => self.event_type ? self.event_type.name : ""
    }
  end

  # /* special code */

  def self.date_match(ts, day_name)
    Date::DAYNAMES.each do |weekday|
      return true if (ts.send(weekday.downcase) && (weekday == day_name))
    end
    return false
  end

  def self.does_not_exist(ts_id, the_date)
    # we want to make sure the event exists on 'day'
    !Event.find_existing_time_slots_in_date(the_date).include?(ts_id)
  end

  # /* from controller */

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  def self.months_available
    dates = Event.all.map{|e| e.starts_at.to_date}
    if dates.empty?
      # we have an error
      return []
    else
      my_month = dates.min
      months = [my_month]
      while my_month.beginning_of_month < dates.max.beginning_of_month
        my_month = my_month.next_month
        months << my_month
      end
      return months
    end
  end

  def self.find_existing_time_slots_in_date(dt)
    # need to include user
    Event.where(["starts_at >= '#{dt.beginning_of_day.to_s(:db)}' and ends_at <= '#{dt.end_of_day.to_s(:db)}'"] ).map(&:time_slot_id)
  end

end
