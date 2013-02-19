class ExpenseTracker::Week < ActiveRecord::Base
  attr_accessible :start_date, :total_spent, :total_spent_cents, :total_spent_currency
  has_many :daily_expenses, :class_name => 'ExpenseTracker::DailyExpense'
  after_find :update_total_spent

  monetize :total_spent_cents

  TOTAL = Money.new(50000)

  def update_total_spent
    self.total_spent = self.daily_expenses.sum{|e| e.amount}
  end

  def progress_statement
    p = progress
    "You are on day #{p[:day_count]} (#{p[:day_percent]}% done) with #{p[:remaining]} remaining."
  end

  def table_array(total_amount = TOTAL)
    # first group by day, sum up amounts by that day
    total = total_amount
    cumulative = Money.new(0)
    #in_week(stdt).group_by{|d| d.date.day}.map.with_index {|a, idx| {day: a.first, spent: a.last.sum{|k| k.amount}, day_count: idx, ideal: total*((7.0-idx)/7.0)}}
    by_dates.map.with_index do |a, idx|
      date = a.first
      es = a.last
      ideal = total*total_on_day(idx)
      spent = es.sum{|k| k.amount}
      cumulative += spent
      remaining = total - cumulative
      surplus = remaining - ideal
      {date: date, day: idx, ideal: ideal, spent: spent, cumulative: cumulative, surplus: surplus, remaining: remaining}
    end
  end

  def chart_array(total_amount = TOTAL)
    total = total_amount
    dates = by_dates
    cumulative = Money.new(0)
    stdt = self.start_date
    (stdt.beginning_of_week(start_day = :thursday)..stdt.end_of_week(start_day = :thursday)).map.with_index do |day, index|
      ideal = total*total_on_day(index)
      if dates[day]
        expenses = dates[day]
        spent = expenses.sum{|e| e.amount}
        cumulative += spent
        remaining = (total - cumulative).to_f
      else
        remaining = nil
      end
      {day: day, ideal: ideal.to_f, remaining: remaining }
    end
  end

  private

  def progress
    d = Date.today
    day_count = (d - d.beginning_of_week(start_day = :thursday)).to_f
    {day_count: day_count,
    day_percent: ((day_count/7.0)*100).round,
    remaining: TOTAL - self.total_spent}
  end

  def total_on_day(i)
    ((7.0-(i+1))/7.0)
  end

  def by_dates
    self.daily_expenses.group_by{|d| d.date}
  end

end
