# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :family_goal do
    name "MyString"
    priority 1
    above_cut false
    description "MyText"
    justification "MyText"
  end
end
