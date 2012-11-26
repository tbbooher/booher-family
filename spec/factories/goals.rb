# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    name "MyString"
    due_date "2012-11-21"
    description "MyText"
  end
end
