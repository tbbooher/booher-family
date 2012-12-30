# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workout do
    workout_date Date.parse("2012-12-12")
    description "Workout with Matt on Saturday"
    power 0
    crossfit_workout_id 1 #should be in exercise !!
    mileage 0
  end
end
