require 'spec_helper'

describe PublicationTypeController do

  describe "GET 'name:string'" do
    it "should be successful" do
      get 'name:string'
      response.should be_success
    end
  end

end
