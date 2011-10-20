require 'spec_helper'

describe "publications/new.html.erb" do
  before(:each) do
    assign(:publication, stub_model(Publication).as_new_record)
  end

  it "renders new publication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publications_path, :method => "post" do
    end
  end
end
