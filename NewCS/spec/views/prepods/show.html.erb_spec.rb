require 'spec_helper'

describe "prepods/show.html.erb" do
  before(:each) do
    @prepod = assign(:prepod, stub_model(Prepod))
  end

  it "renders attributes in <p>" do
    render
  end
end
