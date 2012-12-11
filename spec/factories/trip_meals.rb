# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip_meal do
    meal 1
    link "http://mcdonalds.com/"
    trip_day
    location
    place "McDonalds"
    description "quick bite"
    budget_cents 1000
    budget_currency :USD
  end
end
