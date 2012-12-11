# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    title "Trip to Italy"
    start_date "2012-11-25"
    end_date "2012-11-25"
    description "The coolest trip ever"
    budget 100000 # in cents
    total_cost ''
  end
end
