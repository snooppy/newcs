require 'spec_helper'

describe "publications/index.html.erb" do
  before(:each) do
    assign(:publications, [
      stub_model(Publication),
      stub_model(Publication)
    ])
  end

  it "renders a list of publications" do
    render
  end
end
