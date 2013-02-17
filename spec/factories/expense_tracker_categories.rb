# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense_tracker_category, :class => 'ExpenseTracker::Category' do
    name "MyString"
  end
end
