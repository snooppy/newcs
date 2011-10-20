require 'spec_helper'

describe "shedules/edit.html.erb" do
  before(:each) do
    @shedule = assign(:shedule, stub_model(Shedule,
      :week => 1,
      :day => 1,
      :hour => 1,
      :classroom => 1,
      :sub_group2 => 1,
      :sub_group3 => 1
    ))
  end

  it "renders the edit shedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shedules_path(@shedule), :method => "post" do
      assert_select "input#shedule_week", :name => "shedule[week]"
      assert_select "input#shedule_day", :name => "shedule[day]"
      assert_select "input#shedule_hour", :name => "shedule[hour]"
      assert_select "input#shedule_classroom", :name => "shedule[classroom]"
      assert_select "input#shedule_sub_group2", :name => "shedule[sub_group2]"
      assert_select "input#shedule_sub_group3", :name => "shedule[sub_group3]"
    end
  end
end
