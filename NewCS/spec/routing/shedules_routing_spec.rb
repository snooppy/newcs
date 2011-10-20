require "spec_helper"

describe ShedulesController do
  describe "routing" do

    it "routes to #index" do
      get("/shedules").should route_to("shedules#index")
    end

    it "routes to #new" do
      get("/shedules/new").should route_to("shedules#new")
    end

    it "routes to #show" do
      get("/shedules/1").should route_to("shedules#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shedules/1/edit").should route_to("shedules#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shedules").should route_to("shedules#create")
    end

    it "routes to #update" do
      put("/shedules/1").should route_to("shedules#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shedules/1").should route_to("shedules#destroy", :id => "1")
    end

  end
end
