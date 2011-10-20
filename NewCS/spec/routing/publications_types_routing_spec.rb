require "spec_helper"

describe PublicationsTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/publications_types").should route_to("publications_types#index")
    end

    it "routes to #new" do
      get("/publications_types/new").should route_to("publications_types#new")
    end

    it "routes to #show" do
      get("/publications_types/1").should route_to("publications_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/publications_types/1/edit").should route_to("publications_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/publications_types").should route_to("publications_types#create")
    end

    it "routes to #update" do
      put("/publications_types/1").should route_to("publications_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/publications_types/1").should route_to("publications_types#destroy", :id => "1")
    end

  end
end
