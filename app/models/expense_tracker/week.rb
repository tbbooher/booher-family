class ExpenseTracker::Week < ActiveRecord::Base
  attr_accessible :start_date, :total_spent, :total_spent_cents, :total_spent_currency
  has_many :daily_expenses, :class_name => 'ExpenseTracker::DailyExpense'

  monetize :total_spent_cents

end
