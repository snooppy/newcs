require 'spec_helper'

describe "prepods/edit.html.erb" do
  before(:each) do
    @prepod = assign(:prepod, stub_model(Prepod))
  end

  it "renders the edit prepod form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prepods_path(@prepod), :method => "post" do
    end
  end
end
