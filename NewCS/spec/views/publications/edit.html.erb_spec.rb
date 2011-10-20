require 'spec_helper'

describe "publications/edit.html.erb" do
  before(:each) do
    @publication = assign(:publication, stub_model(Publication))
  end

  it "renders the edit publication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publications_path(@publication), :method => "post" do
    end
  end
end
