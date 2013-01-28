# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sonship_lesson do
    start_date "2013-01-28"
    title "MyString"
    goals "MyText"
    impact "MyText"
    memory_verse "MyText"
  end
end
