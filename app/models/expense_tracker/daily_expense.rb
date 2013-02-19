class ExpenseTracker::DailyExpense < ActiveRecord::Base
  belongs_to :vendor, class_name: "ExpenseTracker::Vendor"
  belongs_to :category, class_name: "ExpenseTracker::Category"
  belongs_to :week, :class_name => 'ExpenseTracker::Week'

  attr_accessible :amount, :date, :vendor_id, :category_id, :amount_cents, :amount_currency, :memo

  monetize :amount_cents

  scope :in_week, lambda { |week_start|
    st = week_start.beginning_of_week(start_day = :thursday)
    where("date BETWEEN ? AND ?", st, 1.week.since(st))
  }

  #def category_name=(name)
  #  self.category = Category.find_or_create_by_name(name) if name.present?
  #end

end
