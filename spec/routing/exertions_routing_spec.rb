require "spec_helper"

describe ExertionsController do
  describe "routing" do

    it "routes to #index" do
      get("/exertions").should route_to("exertions#index")
    end

    it "routes to #new" do
      get("/exertions/new").should route_to("exertions#new")
    end

    it "routes to #show" do
      get("/exertions/1").should route_to("exertions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/exertions/1/edit").should route_to("exertions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/exertions").should route_to("exertions#create")
    end

    it "routes to #update" do
      put("/exertions/1").should route_to("exertions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/exertions/1").should route_to("exertions#destroy", :id => "1")
    end

  end
end
