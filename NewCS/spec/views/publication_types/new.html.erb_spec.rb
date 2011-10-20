require 'spec_helper'

describe "publication_types/new.html.erb" do
  before(:each) do
    assign(:publication_type, stub_model(PublicationType).as_new_record)
  end

  it "renders new publication_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publication_types_path, :method => "post" do
    end
  end
end
