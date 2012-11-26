# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lost_item do
    name "MyString"
    user nil
    date_lost "2012-11-22"
    description "MyText"
    priority 1
  end
end
