# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exertion do
    journal_entry_id 1
    weight "9.99"
    reps 1
    time "9.99"
    distance "9.99"
    exercise_id 1
  end
end
