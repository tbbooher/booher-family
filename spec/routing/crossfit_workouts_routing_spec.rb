require "spec_helper"

describe CrossfitWorkoutsController do
  describe "routing" do

    it "routes to #index" do
      get("/crossfit_workouts").should route_to("crossfit_workouts#index")
    end

    it "routes to #new" do
      get("/crossfit_workouts/new").should route_to("crossfit_workouts#new")
    end

    it "routes to #show" do
      get("/crossfit_workouts/1").should route_to("crossfit_workouts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crossfit_workouts/1/edit").should route_to("crossfit_workouts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crossfit_workouts").should route_to("crossfit_workouts#create")
    end

    it "routes to #update" do
      put("/crossfit_workouts/1").should route_to("crossfit_workouts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crossfit_workouts/1").should route_to("crossfit_workouts#destroy", :id => "1")
    end

  end
end
