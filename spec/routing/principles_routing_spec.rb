require "spec_helper"

describe PrinciplesController do
  describe "routing" do

    it "routes to #index" do
      get("/principles").should route_to("principles#index")
    end

    it "routes to #new" do
      get("/principles/new").should route_to("principles#new")
    end

    it "routes to #show" do
      get("/principles/1").should route_to("principles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/principles/1/edit").should route_to("principles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/principles").should route_to("principles#create")
    end

    it "routes to #update" do
      put("/principles/1").should route_to("principles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/principles/1").should route_to("principles#destroy", :id => "1")
    end

  end
end
