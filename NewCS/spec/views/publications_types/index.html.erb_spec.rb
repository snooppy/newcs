require 'spec_helper'

describe "publications_types/index.html.erb" do
  before(:each) do
    assign(:publications_types, [
      stub_model(PublicationsType,
        :name => "Name"
      ),
      stub_model(PublicationsType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of publications_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
