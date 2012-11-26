require "spec_helper"

describe TripMealsController do
  describe "routing" do

    it "routes to #index" do
      get("/trip_meals").should route_to("trip_meals#index")
    end

    it "routes to #new" do
      get("/trip_meals/new").should route_to("trip_meals#new")
    end

    it "routes to #show" do
      get("/trip_meals/1").should route_to("trip_meals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trip_meals/1/edit").should route_to("trip_meals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trip_meals").should route_to("trip_meals#create")
    end

    it "routes to #update" do
      put("/trip_meals/1").should route_to("trip_meals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trip_meals/1").should route_to("trip_meals#destroy", :id => "1")
    end

  end
end
