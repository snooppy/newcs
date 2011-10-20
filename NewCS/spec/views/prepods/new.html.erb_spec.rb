require 'spec_helper'

describe "prepods/new.html.erb" do
  before(:each) do
    assign(:prepod, stub_model(Prepod).as_new_record)
  end

  it "renders new prepod form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prepods_path, :method => "post" do
    end
  end
end
