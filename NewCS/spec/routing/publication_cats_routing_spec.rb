require "spec_helper"

describe PublicationCatsController do
  describe "routing" do

    it "routes to #index" do
      get("/publication_cats").should route_to("publication_cats#index")
    end

    it "routes to #new" do
      get("/publication_cats/new").should route_to("publication_cats#new")
    end

    it "routes to #show" do
      get("/publication_cats/1").should route_to("publication_cats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/publication_cats/1/edit").should route_to("publication_cats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/publication_cats").should route_to("publication_cats#create")
    end

    it "routes to #update" do
      put("/publication_cats/1").should route_to("publication_cats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/publication_cats/1").should route_to("publication_cats#destroy", :id => "1")
    end

  end
end
