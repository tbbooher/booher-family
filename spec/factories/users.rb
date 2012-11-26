# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "test tim"
    email "tim@theboohers.org"
    password "bigsecret"
    admin false
  end
end
