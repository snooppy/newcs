require 'spec_helper'

describe "publication_types/show.html.erb" do
  before(:each) do
    @publication_type = assign(:publication_type, stub_model(PublicationType))
  end

  it "renders attributes in <p>" do
    render
  end
end
