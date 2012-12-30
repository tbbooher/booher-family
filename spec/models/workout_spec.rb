require 'spec_helper'

describe Workout do
  it "should record the power for a run" do
    DatabaseCleaner.clean
    FactoryGirl.create(:user)
    # create user
    # create a run exercise
    run = FactoryGirl.create(:exercise, calories_per_hour: 700, name: 'run')
    bench = FactoryGirl.create(:exercise, weight: 225, distance: 20, name: 'bench')
    # add a workout that is a five mile run
    workout = FactoryGirl.create(:workout)
    rep1 = Rep.new(workout_id: workout.id, exercise_id: run.id, distance: 4)
    rep2 = Rep.new(workout_id: workout.id, exercise_id: bench.id, weight: 225, count: 5)
    workout.reps << [rep1, rep2]
    workout.total_time = 100.10 # seconds
    workout.computed_power.should eq(100)
  end
end
