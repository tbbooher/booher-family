require "spec_helper"

describe SonshipClassesController do
  describe "routing" do

    it "routes to #index" do
      get("/sonship_classes").should route_to("sonship_classes#index")
    end

    it "routes to #new" do
      get("/sonship_classes/new").should route_to("sonship_classes#new")
    end

    it "routes to #show" do
      get("/sonship_classes/1").should route_to("sonship_classes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sonship_classes/1/edit").should route_to("sonship_classes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sonship_classes").should route_to("sonship_classes#create")
    end

    it "routes to #update" do
      put("/sonship_classes/1").should route_to("sonship_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sonship_classes/1").should route_to("sonship_classes#destroy", :id => "1")
    end

  end
end
