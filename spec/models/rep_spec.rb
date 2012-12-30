require 'spec_helper'

describe Rep do
  it "should calculate work done for a run" do
    DatabaseCleaner.clean
    run = FactoryGirl.create(:exercise, name: 'run', exercise_type: 3, weight: 150)
    # add a workout that is a five mile run
    workout = FactoryGirl.create(:workout)
    # 10 km in 1 hour
    rep = Rep.new(workout_id: workout.id, seconds: 60*8, exercise_id: run.id, distance: 1)
    rep.save
    rep.power.should eql(988.0797788415238)
    #workout.reps << Rep.new(workout_id: workout.id, exercise_id: run.id, distance: 1)
    #workout.computed_power.should eq(100)
  end

  it "should calculate work done for 3x150 bench" do
    DatabaseCleaner.clean
    bench = FactoryGirl.create(:exercise, name: 'bench', exercise_type: 2, distance: 16)
    # add a workout that is a five mile run
    workout = FactoryGirl.create(:workout)
    # 10 km in 1 hour
    rep = Rep.new(workout_id: workout.id, seconds: 60*5, exercise_id: bench.id, count: 3, weight: 150)
    rep.save
    rep.power.should eql(0.4608494719999999)
    #workout.reps << Rep.new(workout_id: workout.id, exercise_id: run.id, distance: 1)
    #workout.computed_power.should eq(100)
  end
end
