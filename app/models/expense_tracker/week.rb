class ExpenseTracker::Week < ActiveRecord::Base
  attr_accessible :start_date, :total_spent, :total_spent_cents, :total_spent_currency
  has_many :expenses, :class_name => 'ExpenseTracker::DailyExpense'
end
