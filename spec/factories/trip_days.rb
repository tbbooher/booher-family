# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip_day do
    day_date "2012-11-25"
    lodging "MyString"
    lodging_link "MyString"
    location "MyString"
    loc_lat "9.99"
    loc_lon "9.99"
    notes "MyString"
  end
end
