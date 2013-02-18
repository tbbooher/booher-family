require "spec_helper"

describe ExpenseTracker::DailyExpensesController do
  describe "routing" do

    it "routes to #index" do
      get("/expense_tracker/daily_expenses").should route_to("expense_tracker/daily_expenses#index")
    end

    it "routes to #new" do
      get("/expense_tracker/daily_expenses/new").should route_to("expense_tracker/daily_expenses#new")
    end

    it "routes to #show" do
      get("/expense_tracker/daily_expenses/1").should route_to("expense_tracker/daily_expenses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/expense_tracker/daily_expenses/1/edit").should route_to("expense_tracker/daily_expenses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/expense_tracker/daily_expenses").should route_to("expense_tracker/daily_expenses#create")
    end

    it "routes to #update" do
      put("/expense_tracker/daily_expenses/1").should route_to("expense_tracker/daily_expenses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/expense_tracker/daily_expenses/1").should route_to("expense_tracker/daily_expenses#destroy", :id => "1")
    end

  end
end
