require 'spec_helper'

describe "publication_cats/index.html.erb" do
  before(:each) do
    assign(:publication_cats, [
      stub_model(PublicationCat,
        :name => "Name"
      ),
      stub_model(PublicationCat,
        :name => "Name"
      )
    ])
  end

  it "renders a list of publication_cats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
