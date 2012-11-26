require "spec_helper"

describe LostItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/lost_items").should route_to("lost_items#index")
    end

    it "routes to #new" do
      get("/lost_items/new").should route_to("lost_items#new")
    end

    it "routes to #show" do
      get("/lost_items/1").should route_to("lost_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lost_items/1/edit").should route_to("lost_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lost_items").should route_to("lost_items#create")
    end

    it "routes to #update" do
      put("/lost_items/1").should route_to("lost_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lost_items/1").should route_to("lost_items#destroy", :id => "1")
    end

  end
end
