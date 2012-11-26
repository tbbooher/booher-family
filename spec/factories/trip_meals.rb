# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip_meal do
    meal ""
    location "MyString"
    link "MyString"
    budget 1
    user nil
  end
end
