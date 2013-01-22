class Event < ActiveRecord::Base
  belongs_to :time_slot

  attr_accessible :all_day, :description, :ends_at, :starts_at, :title, :time_slot_id, :event_type_id

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  TYPES = {1 => :aupair, 2 => :family}

  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}
  scope :aupair, where(event_type_id: 1)

  scope :started_or_finished, lambda {|st,ed| where("(starts_at BETWEEN :st AND :ed) OR (ends_at BETWEEN :st AND :ed) OR (starts_at <= :st AND ends_at >= :ed)", st: st, ed: ed)}

  scope :started_between, lambda {|start_date| where("starts_at >= ? AND starts_at <= ?", start_date )}
  scope :ended_between, lambda {|end_date| where("ends_at >= ? AND ends_at <= ?", end_date )}

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
        :url => Rails.application.routes.url_helpers.event_path(id),
        :className => self.event_type_name
    }
  end

  def event_type_name
    unless self.event_type_id.nil?
      TYPES[self.event_type_id]
    else
      "none"
    end
  end

  class << self

    def worked_in_week(date_in_week)
      seconds_worked(date_in_week.beginning_of_week, date_in_week.end_of_week)
    end

    def destroy_all_in_month(month_string)
      date = Date.parse("1-#{month_string}")
      Event.destroy_all(["starts_at >= ? and starts_at < ?", date.beginning_of_month, date.next_month.beginning_of_month])
    end

    def seconds_worked(start_date, end_date)
      # given an arbitrary time line three cases must be considered
      duration = 0
      Event.aupair.started_or_finished(start_date, end_date).each do |e|
        duration = duration + (e.ends_at - e.starts_at)
      end
      duration
    end

    def total_duration_for_time_slots
      duration = 0
      [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].each do |day|
        duration = duration + TimeSlot.where(day => true).inject(0) {|result, ts| result + (ts.ends_at - ts.starts_at)}
      end
      duration
    end

    def populate_next_two_weeks
      start_day = Date.today.beginning_of_week(:sunday)
      end_day = start_day.end_of_week(:sunday)+7
      TimeSlot.all.each do |ts|
        (start_day..end_day).to_a.each do |day|
          starts_at = Time.local(day.year,day.month,day.day,ts.starts_at.hour,ts.starts_at.min,0)
          if Event.date_match(ts,starts_at.strftime('%A')) && Event.does_not_exist(ts.id,starts_at)
            e = Event.new
            e.starts_at = Time.local(day.year,day.month,day.day, ts.starts_at.hour, ts.starts_at.min)
            e.ends_at = Time.local(day.year,day.month,day.day, ts.ends_at.hour, ts.ends_at.min)
            e.time_slot_id = ts.id
            e.event_type_id = 1
            e.title = ts.title.blank? ? "no title" : ts.title
            e.save!
          end
        end
      end
    end

    # /* special code */

    def date_match(ts, day_name)
      Date::DAYNAMES.each do |weekday|
        return true if (ts.send(weekday.downcase) && (weekday == day_name))
      end
      return false
    end

    def does_not_exist(ts_id, the_date)
      # we want to make sure the event exists on 'day'
      !Event.find_existing_time_slots_in_date(the_date).include?(ts_id)
    end

    # /* from controller */

    def format_date(date_time)
      Time.at(date_time.to_i).to_formatted_s(:db)
    end

    def months_available
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

    def find_existing_time_slots_in_date(dt)
      Event.where(["starts_at >= '#{dt.beginning_of_day.to_s(:db)}' and ends_at <= '#{dt.end_of_day.to_s(:db)}'"] ).map(&:time_slot_id)
    end

  end

end
