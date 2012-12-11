# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name "Play Golf"
    location
    description "18 holes"
    trip_day
    budget_cents 10000
    budget_currency :USD
    activity_type 1
  end
end
