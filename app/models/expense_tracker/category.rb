class ExpenseTracker::Category < ActiveRecord::Base
  attr_accessible :name
  has_many :expense_tracker_daily_expenses, :class_name => 'ExpenseTracker::DailyExpense'
end
