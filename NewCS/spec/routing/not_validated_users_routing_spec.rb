require "spec_helper"

describe NotValidatedUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/not_validated_users").should route_to("not_validated_users#index")
    end

    it "routes to #new" do
      get("/not_validated_users/new").should route_to("not_validated_users#new")
    end

    it "routes to #show" do
      get("/not_validated_users/1").should route_to("not_validated_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/not_validated_users/1/edit").should route_to("not_validated_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/not_validated_users").should route_to("not_validated_users#create")
    end

    it "routes to #update" do
      put("/not_validated_users/1").should route_to("not_validated_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/not_validated_users/1").should route_to("not_validated_users#destroy", :id => "1")
    end

  end
end
