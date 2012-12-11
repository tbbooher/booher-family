# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name "MyString"
    location_id 1
    description "MyText"
    trip_day_id 1
  end
end
