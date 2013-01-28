# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "Watch Kids"
    starts_at "2012-11-30 12:00:00 Z"
    ends_at "2012-11-30 22:00:00 Z"
    all_day false
    description "Good time to get work done"
    event_type_id 1
  end
end
