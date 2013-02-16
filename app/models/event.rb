class Event < ActiveRecord::Base

  attr_accessible :all_day, :description, :ends_at, :starts_at, :title, :event_type_id

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :event_end_is_bigger_than_start
  validate :au_pair_event_cant_be_more_than_10
  validate :should_not_go_past_midnight

  TYPES = {1 => :aupair, 2 => :family}

  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}
  scope :aupair, where(event_type_id: 1)
  scope :not_all_day, where("all_day IS NOT true")

  scope :started_or_finished, lambda {|st,ed| where("(starts_at BETWEEN :st AND :ed) OR (ends_at BETWEEN :st AND :ed) OR (starts_at <= :st AND ends_at >= :ed)", st: st, ed: ed)}

  #named_scope :this_week, :conditions => ['starts_at > ? and ends_at < ?', Time.now.at_beginning_of_week, Time.now]

  scope :started_between, lambda {|start_date| where("starts_at >= ? AND starts_at <= ?", start_date )}
  scope :ended_between, lambda {|end_date| where("ends_at >= ? AND ends_at <= ?", end_date )}

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
        :id => self.id,
        :title => self.title,
        :description => self.description || "",
        :start => starts_at.iso8601,
        :end => ends_at.iso8601,
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

  def duration(units = :seconds)
    seconds = self.ends_at - self.starts_at
    case units
      when :seconds
        seconds
      when :minutes
        seconds/60
      when :hours
        seconds/(60*60)
    end
  end

  def au_pair_event_cant_be_more_than_10
    if self.duration(:hours) > 10 && self.event_type_id == 1
      errors.add(:ends_at, 'au pairs can not work more than 10 hours a day')
    end
  end

  def event_end_is_bigger_than_start
    if starts_at >= ends_at
      errors.add(:ends_at, 'end of event must be greater than start')
    end
  end

  def should_not_go_past_midnight
    if self.event_type_id == 1
      errors.add(:ends_at, 'au pair events can not go past mid night') unless (starts_at.day == ends_at.day)
    end
  end

  class << self

    #def worked_in_week(date_in_week)
    #  seconds_worked(date_in_week.beginning_of_week, date_in_week.end_of_week)
    #end

    def all_in_week(date_in_week)
      st = date_in_week.beginning_of_week(start_day = :sunday).beginning_of_day
      ed = date_in_week.beginning_of_week(start_day = :sunday).next_week(day = :sunday).beginning_of_day
      started_or_finished(st,ed).aupair.not_all_day
    end

    def weekly_hours(date_in_week)
      # this assumes no au pair events go past midnight (can easily change)
      all_in_week(date_in_week).inject(0) {|sum, e| sum + e.duration(:hours)}
    end

    def destroy_all_in_month(month_string)
      date = Date.parse("1-#{month_string}")
      Event.destroy_all(["starts_at >= ? and starts_at < ?", date.beginning_of_month, date.next_month.beginning_of_month])
    end

    #def seconds_worked(start_date, end_date)
    #  # given an arbitrary time line three cases must be considered
    #  duration = 0
    #  Event.aupair.started_or_finished(start_date, end_date).each do |e|
    #    duration = duration + (e.ends_at - e.starts_at)
    #  end
    #  duration
    #end

    #def total_duration_for_time_slots
    #  duration = 0
    #  [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].each do |day|
    #    duration = duration + TimeSlot.where(day => true).inject(0) {|result, ts| result + (ts.ends_at - ts.starts_at)}
    #  end
    #  duration
    #end

    def format_date(date_time)
      Time.at(date_time.to_i).to_formatted_s(:db)
    end

  end

end
