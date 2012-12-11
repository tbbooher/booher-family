# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip_day do
    day_date {Date.parse("2012-12-01")}
    lodging "The best place in town"
    lodging_link "http://www.theritz.com/"
    location
    trip
    notes "This is the first day of the trip. We will go shopping"
    goal "to divide and conquer"
  end
end
