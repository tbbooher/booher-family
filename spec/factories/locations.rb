# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    loc_lat "9.99"
    loc_lon "9.99"
    description "MyText"
  end
end
