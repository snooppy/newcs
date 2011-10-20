require "spec_helper"

describe PrepodsController do
  describe "routing" do

    it "routes to #index" do
      get("/prepods").should route_to("prepods#index")
    end

    it "routes to #new" do
      get("/prepods/new").should route_to("prepods#new")
    end

    it "routes to #show" do
      get("/prepods/1").should route_to("prepods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prepods/1/edit").should route_to("prepods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prepods").should route_to("prepods#create")
    end

    it "routes to #update" do
      put("/prepods/1").should route_to("prepods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prepods/1").should route_to("prepods#destroy", :id => "1")
    end

  end
end
