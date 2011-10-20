require 'spec_helper'

describe "publications/show.html.erb" do
  before(:each) do
    @publication = assign(:publication, stub_model(Publication))
  end

  it "renders attributes in <p>" do
    render
  end
end
