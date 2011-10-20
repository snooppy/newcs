require 'spec_helper'

describe "shedules/index.html.erb" do
  before(:each) do
    assign(:shedules, [
      stub_model(Shedule,
        :week => 1,
        :day => 1,
        :hour => 1,
        :classroom => 1,
        :sub_group2 => 1,
        :sub_group3 => 1
      ),
      stub_model(Shedule,
        :week => 1,
        :day => 1,
        :hour => 1,
        :classroom => 1,
        :sub_group2 => 1,
        :sub_group3 => 1
      )
    ])
  end

  it "renders a list of shedules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
