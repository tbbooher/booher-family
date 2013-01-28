require "spec_helper"

describe SonshipQuestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/sonship_questions").should route_to("sonship_questions#index")
    end

    it "routes to #new" do
      get("/sonship_questions/new").should route_to("sonship_questions#new")
    end

    it "routes to #show" do
      get("/sonship_questions/1").should route_to("sonship_questions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sonship_questions/1/edit").should route_to("sonship_questions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sonship_questions").should route_to("sonship_questions#create")
    end

    it "routes to #update" do
      put("/sonship_questions/1").should route_to("sonship_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sonship_questions/1").should route_to("sonship_questions#destroy", :id => "1")
    end

  end
end
