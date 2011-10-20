require 'spec_helper'

describe "publication_types/edit.html.erb" do
  before(:each) do
    @publication_type = assign(:publication_type, stub_model(PublicationType))
  end

  it "renders the edit publication_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publication_types_path(@publication_type), :method => "post" do
    end
  end
end
