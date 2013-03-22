class JournalEntry < ActiveRecord::Base
  attr_accessible :chrissy, :description, :devotional, :discipline, :entry_date, :facepicking, :fitness, :flossed, :friends_in_focus, :health_statement, :lack_of_discipline, :memory_verse, :problem_attempted, :problem_of_the_day, :problem_solved, :purity, :relational, :sick, :stress, :to_do, :workout
  # require entry_date

  scope :entered_between, lambda {|start_date, end_date| where("entry_date >= ? AND entry_date <= ?", start_date, end_date )}

  def self.smooth_results
    # let's, say, average every week
    entries = all.sort_by{|je| je.entry_date}
    dt = entries.first.entry_date
    d = []
    while dt < entries.last.entry_date
      dt_nxt = dt.next_week
      dts = entered_between(dt, dt_nxt)
      puts dts.size
      fields = {date: dt}
      [:fitness, :chrissy, :devotional].each do |k|
        fields.merge!({k => nilmean(dts.map {|je| je[k]})})
      end
      d << fields
          #fitness: dts.map(&:fitness).mean, date: dt, purity: dts.map(&:purity).mean, chrissy: dts.map(&:chrissy).mean, devotional: dts.map(&:devotional).mean}
      dt = dt_nxt
    end
    d
  end

  def self.nilmean(a)
    unless a.nil?
      if a.size == 1 || a.is_a?(Fixnum)
        arr = a.first
        if arr.nil?
          nil
        else
          arr
        end
      else
        arr = a.compact
        (arr.inject(0.0) { |result, el| result + el }) / arr.size
      end
    end
  end

end
