# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_slot do
    title "Just a test event"
    event_type nil
    monday true
    tuesday false
    wednesday false
    thursday false
    friday false
    saturday false
    sunday false
    user
    starts_at "2012-11-22 07:00:00"
    ends_at "2012-11-22 08:00:00"
  end
end
