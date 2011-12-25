require "spec_helper"

describe FormerUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/former_users").should route_to("former_users#index")
    end

    it "routes to #new" do
      get("/former_users/new").should route_to("former_users#new")
    end

    it "routes to #show" do
      get("/former_users/1").should route_to("former_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/former_users/1/edit").should route_to("former_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/former_users").should route_to("former_users#create")
    end

    it "routes to #update" do
      put("/former_users/1").should route_to("former_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/former_users/1").should route_to("former_users#destroy", :id => "1")
    end

  end
end
