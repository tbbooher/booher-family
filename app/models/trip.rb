class Trip < ActiveRecord::Base
  attr_accessible :budget, :description, :end_date, :start_date, :title, :total_cost

  has_many :trip_days
  belongs_to :location

  def date_range
    "From #{self.start_date.to_s(:day_only)} to #{self.end_date.to_s(:day_only)} #{self.end_date.to_s(:month)}"
  end

  def total_spent
    self.trip_days.map(&:total_spent).sum
  end

end
