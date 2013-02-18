# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense_tracker_week, :class => 'ExpenseTracker::Week' do
    start_date "2013-02-18"
    total_spent ""
  end
end
