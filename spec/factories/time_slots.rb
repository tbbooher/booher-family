# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_slot do
    title "MyString"
    event_type nil
    monday false
    tuesday false
    wednesday false
    thursday false
    friday false
    saturday false
    sunday false
    user nil
    starts_at "2012-11-22 07:14:42"
  end
end
