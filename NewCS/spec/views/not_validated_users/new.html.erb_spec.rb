require 'spec_helper'

describe "not_validated_users/new.html.erb" do
  before(:each) do
    assign(:not_validated_user, stub_model(NotValidatedUser,
      :login => "MyString",
      :password => "MyString",
      :second_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :sex => "MyString",
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new not_validated_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => not_validated_users_path, :method => "post" do
      assert_select "input#not_validated_user_login", :name => "not_validated_user[login]"
      assert_select "input#not_validated_user_password", :name => "not_validated_user[password]"
      assert_select "input#not_validated_user_second_name", :name => "not_validated_user[second_name]"
      assert_select "input#not_validated_user_last_name", :name => "not_validated_user[last_name]"
      assert_select "input#not_validated_user_email", :name => "not_validated_user[email]"
      assert_select "input#not_validated_user_sex", :name => "not_validated_user[sex]"
      assert_select "input#not_validated_user_role", :name => "not_validated_user[role]"
    end
  end
end
