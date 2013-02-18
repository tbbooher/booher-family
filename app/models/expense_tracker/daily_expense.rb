class ExpenseTracker::DailyExpense < ActiveRecord::Base
  belongs_to :vendor, class_name: "ExpenseTracker::Vendor"
  belongs_to :category, class_name: "ExpenseTracker::Category"
  belongs_to :week, :class_name => 'ExpenseTracker::Week'

  attr_accessible :amount, :date, :vendor_id, :category_id, :amount_cents, :amount_currency

  monetize :amount_cents

  scope :in_week, lambda { |week_start|
    st = week_start.beginning_of_week(start_day = :thursday)
    where("date BETWEEN ? AND ?", st, 1.week.since(st))
  }

  #def category_name=(name)
  #  self.category = Category.find_or_create_by_name(name) if name.present?
  #end

  class << self
    def weekly_expenses(stdt = Date.today)
      # first group by day, sum up amounts by that day
      total = Money.new(50000)
      cumulative = Money.new(0)
      #in_week(stdt).group_by{|d| d.date.day}.map.with_index {|a, idx| {day: a.first, spent: a.last.sum{|k| k.amount}, day_count: idx, ideal: total*((7.0-idx)/7.0)}}
      in_week(stdt).group_by{|d| d.date}.map.with_index do |a, idx|
        date = a.first
        es = a.last
        ideal = total*((7.0-(idx+1))/7.0)
        spent = es.sum{|k| k.amount}
        cumulative += spent
        remaining = total - cumulative
        surplus = remaining - ideal
        {date: date, day: idx, ideal: ideal, spent: spent, cumulative: cumulative, surplus: surplus, remaining: remaining}
      end
    end

    def full_week(stdt = Date.today, total_amount = 50000)
      total = Money.new(total_amount)
      dates = in_week(stdt).group_by{|d| d.date}
      cumulative = Money.new(0)
      (stdt.beginning_of_week(start_day = :thursday)..stdt.end_of_week(start_day = :thursday)).map.with_index do |day, index|
        ideal = total*((7.0-(index+1))/7.0)
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
  end

end
