require "spec_helper"

describe SonshipLessonsController do
  describe "routing" do

    it "routes to #index" do
      get("/sonship_lessons").should route_to("sonship_lessons#index")
    end

    it "routes to #new" do
      get("/sonship_lessons/new").should route_to("sonship_lessons#new")
    end

    it "routes to #show" do
      get("/sonship_lessons/1").should route_to("sonship_lessons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sonship_lessons/1/edit").should route_to("sonship_lessons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sonship_lessons").should route_to("sonship_lessons#create")
    end

    it "routes to #update" do
      put("/sonship_lessons/1").should route_to("sonship_lessons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sonship_lessons/1").should route_to("sonship_lessons#destroy", :id => "1")
    end

  end
end
