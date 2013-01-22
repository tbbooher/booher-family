# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    amount 1
    date "2013-01-21 16:52:53"
    category 1
  end
end
