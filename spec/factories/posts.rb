# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    tag_id nil
    user_id nil
    body "MyText"
    title "MyString"
  end
end
