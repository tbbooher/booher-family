require 'spec_helper'

describe TripDay do
  it "should add up a correct total for the day" do
    # create three meals with prices [11, 18, 23.58]
    # create three activities with [8.23,7,3] for prices
    # check if day total is 70.81
    td = FactoryGirl.create(:trip_day)
    l = FactoryGirl.create(:location)
    [11, 18, 23.58].each do |price|
      FactoryGirl.create(:activity, budget: price, currency: :USD, trip_day: td, location: l)
    end
    [8.23,7,3].each do |price|
      FactoryGirl.create(:trip_meal, budget: price, currency: :USD, trip_day: td, location: l)
    end
    td.total_budget.to_s.should eq("70.81")
  end

  it "should add up a correct total for the day with mixed currencies" do
    # create three meals with prices [11, 18, 23.58]
    # create three activities with [8.23,7,3] for prices
    # check if day total is 70.81
    td = FactoryGirl.create(:trip_day)
    l = FactoryGirl.create(:location)
    [[11, :USD], [18, :USD], [23.58,:EUR]].each do |price, currency|
      FactoryGirl.create(:activity, budget: price, currency: currency, trip_day: td, location: l)
    end
    [8.23,7,3].each do |price|
      FactoryGirl.create(:trip_meal, budget: price, currency: :USD, trip_day: td, location: l)
    end
    td.total_budget.to_s.should eq("77.75")
  end

end
