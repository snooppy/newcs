require 'spec_helper'

describe "prepods/index.html.erb" do
  before(:each) do
    assign(:prepods, [
      stub_model(Prepod),
      stub_model(Prepod)
    ])
  end

  it "renders a list of prepods" do
    render
  end
end
