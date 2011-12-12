require 'spec_helper'

describe "settings/new.html.erb" do
  before(:each) do
    assign(:setting, stub_model(Setting,
      :images => false,
      :students => false,
      :subjects => false,
      :shedules => false,
      :marks => false,
      :files => false,
      :publications => false
    ).as_new_record)
  end

  it "renders new setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path, :method => "post" do
      assert_select "input#setting_images", :name => "setting[images]"
      assert_select "input#setting_students", :name => "setting[students]"
      assert_select "input#setting_subjects", :name => "setting[subjects]"
      assert_select "input#setting_shedules", :name => "setting[shedules]"
      assert_select "input#setting_marks", :name => "setting[marks]"
      assert_select "input#setting_files", :name => "setting[files]"
      assert_select "input#setting_publications", :name => "setting[publications]"
    end
  end
end
