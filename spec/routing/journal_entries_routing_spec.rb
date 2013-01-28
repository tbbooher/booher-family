require "spec_helper"

describe JournalEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/journal_entries").should route_to("journal_entries#index")
    end

    it "routes to #new" do
      get("/journal_entries/new").should route_to("journal_entries#new")
    end

    it "routes to #show" do
      get("/journal_entries/1").should route_to("journal_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/journal_entries/1/edit").should route_to("journal_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/journal_entries").should route_to("journal_entries#create")
    end

    it "routes to #update" do
      put("/journal_entries/1").should route_to("journal_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/journal_entries/1").should route_to("journal_entries#destroy", :id => "1")
    end

  end
end
