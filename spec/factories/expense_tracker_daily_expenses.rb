# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense_tracker_daily_expense, :class => 'ExpenseTracker::DailyExpense' do
    amount 1
    date "2013-02-17"
    vendor nil
    category nil
  end
end
