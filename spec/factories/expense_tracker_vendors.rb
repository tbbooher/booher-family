# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense_tracker_vendor, :class => 'ExpenseTracker::Vendor' do
    name "Walmart"
  end
end
