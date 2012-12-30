class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :height_in_inches, :weight, :admin, :name, :neck, :torso, :pelvis, :femur, :tibia, :ankle, :foot, :humerus, :forearm, :hand, :neck_weight, :torso_weight, :pelvis_weight, :femur_weight, :tibia_weight, :ankle_weight, :foot_weight, :humerus_weight, :forearm_weight, :hand_weight

  has_many :goals
  has_many :lost_items
  has_many :events
  has_many :time_slots
  has_many :workouts

  def worked_in_week(date_in_week)
    self.seconds_worked(date_in_week.beginning_of_week, date_in_week.end_of_week)
  end

  def total_duration_for_time_slots
    time_slots = self.time_slots
    duration = 0
    [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday].each do |day|
      duration = duration + time_slots.where(day => true).inject(0) {|result, ts| result + (ts.ends_at - ts.starts_at)}
    end
    duration
  end

  def seconds_worked(start_date, end_date)
    # given an arbitrary time line three cases must be considered
    duration = 0
    self.events.started_or_finished(start_date, end_date).each do |e|
      duration = duration + (e.ends_at - e.starts_at)
    end
    duration
  end

  def populate_next_two_weeks
    start_day = Date.today.beginning_of_week(:sunday)
    end_day = start_day.end_of_week(:sunday)+7
    TimeSlot.where(user_id: self.id).each do |ts|
      (start_day..end_day).to_a.each do |day|
        starts_at = Time.local(day.year,day.month,day.day,ts.starts_at.hour,ts.starts_at.min,0)
        if Event.date_match(ts,starts_at.strftime('%A')) && Event.does_not_exist(ts.id,starts_at)
          e = Event.new
          e.starts_at = Time.local(day.year,day.month,day.day, ts.starts_at.hour, ts.starts_at.min)
          e.ends_at = Time.local(day.year,day.month,day.day, ts.ends_at.hour, ts.ends_at.min)
          e.time_slot_id = ts.id
          e.user = self
          e.event_type = ts.event_type
          e.title = ts.title.blank? ? "no title" : ts.title
          e.save!
        end
      end
    end
  end

end
