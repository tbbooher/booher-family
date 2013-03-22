class JournalEntry < ActiveRecord::Base
  attr_accessible :chrissy, :description, :devotional, :discipline, :entry_date, :facepicking, :fitness, :flossed, :friends_in_focus, :health_statement, :lack_of_discipline, :memory_verse, :problem_attempted, :problem_of_the_day, :problem_solved, :purity, :relational, :sick, :stress, :to_do, :workout
  # require entry_date

  scope :entered_between, lambda {|start_date, end_date| where("entry_date >= ? AND entry_date <= ?", start_date, end_date )}

  require 'array'

  def self.smooth_results
    # let's, say, average every week
    dt = first.entry_date
    d = []
    while dt < last.entry_date
      dt_nxt = dt.next_week
      dts = entered_between(dt, dt_nxt)
      puts dts.size
      d << {fitness: dts.map(&:fitness).mean, date: dt, purity: dts.map(&:purity).mean, chrissy: dts.map(&:chrissy).mean, devotional: dts.map(&:devotional).mean}
      dt = dt_nxt
    end
    d
  end

end
