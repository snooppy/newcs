require 'spec_helper'

describe "publication_types/index.html.erb" do
  before(:each) do
    assign(:publication_types, [
      stub_model(PublicationType),
      stub_model(PublicationType)
    ])
  end

  it "renders a list of publication_types" do
    render
  end
end
