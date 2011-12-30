require 'spec_helper'

describe "not_validated_users/index.html.erb" do
  before(:each) do
    assign(:not_validated_users, [
      stub_model(NotValidatedUser,
        :login => "Login",
        :password => "Password",
        :second_name => "Second Name",
        :last_name => "Last Name",
        :email => "Email",
        :sex => "Sex",
        :role => "Role"
      ),
      stub_model(NotValidatedUser,
        :login => "Login",
        :password => "Password",
        :second_name => "Second Name",
        :last_name => "Last Name",
        :email => "Email",
        :sex => "Sex",
        :role => "Role"
      )
    ])
  end

  it "renders a list of not_validated_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Second Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
