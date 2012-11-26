require "spec_helper"

describe FamilyGoalsController do
  describe "routing" do

    it "routes to #index" do
      get("/family_goals").should route_to("family_goals#index")
    end

    it "routes to #new" do
      get("/family_goals/new").should route_to("family_goals#new")
    end

    it "routes to #show" do
      get("/family_goals/1").should route_to("family_goals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/family_goals/1/edit").should route_to("family_goals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/family_goals").should route_to("family_goals#create")
    end

    it "routes to #update" do
      put("/family_goals/1").should route_to("family_goals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/family_goals/1").should route_to("family_goals#destroy", :id => "1")
    end

  end
end
