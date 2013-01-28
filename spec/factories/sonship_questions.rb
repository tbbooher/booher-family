# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sonship_question do
    sonship_lesson_id 1
    question "MyText"
    answer "MyText"
  end
end
