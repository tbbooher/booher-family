# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense_tracker_daily_expense, :class => 'ExpenseTracker::DailyExpense' do
    amount_cents 1023
    date "2013-02-17"
    association :vendor, factory: 'expense_tracker_vendor'
    association :category, factory: 'expense_tracker_category'
  end
end
