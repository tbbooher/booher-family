require "spec_helper"

describe TripDaysController do
  describe "routing" do

    it "routes to #index" do
      get("/trip_days").should route_to("trip_days#index")
    end

    it "routes to #new" do
      get("/trip_days/new").should route_to("trip_days#new")
    end

    it "routes to #show" do
      get("/trip_days/1").should route_to("trip_days#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trip_days/1/edit").should route_to("trip_days#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trip_days").should route_to("trip_days#create")
    end

    it "routes to #update" do
      put("/trip_days/1").should route_to("trip_days#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trip_days/1").should route_to("trip_days#destroy", :id => "1")
    end

  end
end
