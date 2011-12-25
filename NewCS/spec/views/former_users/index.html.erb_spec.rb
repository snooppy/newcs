require 'spec_helper'

describe "former_users/index.html.erb" do
  before(:each) do
    assign(:former_users, [
      stub_model(FormerUser,
        :name => "Name",
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(FormerUser,
        :name => "Name",
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of former_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
