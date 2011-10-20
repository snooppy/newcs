require 'spec_helper'

describe "publications_types/show.html.erb" do
  before(:each) do
    @publications_type = assign(:publications_type, stub_model(PublicationsType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
