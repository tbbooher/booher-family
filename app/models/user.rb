class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :admin, :email, :name

  has_many :goals
  has_many :lost_items
  has_many :events
  has_many :time_slots

  def worked_in_week(date_in_week)
    self.seconds_worked(date_in_week.beginning_of_week, date_in_week.end_of_week)
  end

  def seconds_worked(start_date, end_date)
    # given an arbitrary time line three cases must be considered
    duration = 0
    self.events.started_or_finished(start_date, end_date).each do |e|
      duration = duration + (e.ends_at - e.starts_at)
    end
    duration
  end

end
