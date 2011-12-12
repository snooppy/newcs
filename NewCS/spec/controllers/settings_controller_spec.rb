require 'spec_helper'

describe SettingsController do

  describe "GET 'images:boolean'" do
    it "returns http success" do
      get 'images:boolean'
      response.should be_success
    end
  end

  describe "GET 'students:boolean'" do
    it "returns http success" do
      get 'students:boolean'
      response.should be_success
    end
  end

  describe "GET 'subjects:boolean'" do
    it "returns http success" do
      get 'subjects:boolean'
      response.should be_success
    end
  end

  describe "GET 'shedules:boolean'" do
    it "returns http success" do
      get 'shedules:boolean'
      response.should be_success
    end
  end

  describe "GET 'marks:boolean'" do
    it "returns http success" do
      get 'marks:boolean'
      response.should be_success
    end
  end

  describe "GET 'files:boolean'" do
    it "returns http success" do
      get 'files:boolean'
      response.should be_success
    end
  end

  describe "GET 'publications:boolean'" do
    it "returns http success" do
      get 'publications:boolean'
      response.should be_success
    end
  end

end
