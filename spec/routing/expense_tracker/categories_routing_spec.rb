require "spec_helper"

describe ExpenseTracker::CategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/expense_tracker/categories").should route_to("expense_tracker/categories#index")
    end

    it "routes to #new" do
      get("/expense_tracker/categories/new").should route_to("expense_tracker/categories#new")
    end

    it "routes to #show" do
      get("/expense_tracker/categories/1").should route_to("expense_tracker/categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/expense_tracker/categories/1/edit").should route_to("expense_tracker/categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/expense_tracker/categories").should route_to("expense_tracker/categories#create")
    end

    it "routes to #update" do
      put("/expense_tracker/categories/1").should route_to("expense_tracker/categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/expense_tracker/categories/1").should route_to("expense_tracker/categories#destroy", :id => "1")
    end

  end
end
