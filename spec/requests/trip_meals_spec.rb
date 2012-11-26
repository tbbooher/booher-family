require 'spec_helper'

describe "TripMeals" do
  describe "GET /trip_meals" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get trip_meals_path
      response.status.should be(200)
    end
  end
end
