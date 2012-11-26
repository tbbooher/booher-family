# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    title "MyString"
    start_date "2012-11-25"
    end_date "2012-11-25"
    description "MyText"
    budget 1
    total_cost 1
  end
end
