require "spec_helper"

describe ExpenseTracker::WeeksController do
  describe "routing" do

    it "routes to #index" do
      get("/expense_tracker/weeks").should route_to("expense_tracker/weeks#index")
    end

    it "routes to #new" do
      get("/expense_tracker/weeks/new").should route_to("expense_tracker/weeks#new")
    end

    it "routes to #show" do
      get("/expense_tracker/weeks/1").should route_to("expense_tracker/weeks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/expense_tracker/weeks/1/edit").should route_to("expense_tracker/weeks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/expense_tracker/weeks").should route_to("expense_tracker/weeks#create")
    end

    it "routes to #update" do
      put("/expense_tracker/weeks/1").should route_to("expense_tracker/weeks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/expense_tracker/weeks/1").should route_to("expense_tracker/weeks#destroy", :id => "1")
    end

  end
end
