require "spec_helper"

describe ExpenseTracker::VendorsController do
  describe "routing" do

    it "routes to #index" do
      get("/expense_tracker/vendors").should route_to("expense_tracker/vendors#index")
    end

    it "routes to #new" do
      get("/expense_tracker/vendors/new").should route_to("expense_tracker/vendors#new")
    end

    it "routes to #show" do
      get("/expense_tracker/vendors/1").should route_to("expense_tracker/vendors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/expense_tracker/vendors/1/edit").should route_to("expense_tracker/vendors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/expense_tracker/vendors").should route_to("expense_tracker/vendors#create")
    end

    it "routes to #update" do
      put("/expense_tracker/vendors/1").should route_to("expense_tracker/vendors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/expense_tracker/vendors/1").should route_to("expense_tracker/vendors#destroy", :id => "1")
    end

  end
end
