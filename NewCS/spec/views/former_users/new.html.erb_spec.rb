require 'spec_helper'

describe "former_users/new.html.erb" do
  before(:each) do
    assign(:former_user, stub_model(FormerUser,
      :name => "MyString",
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new former_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => former_users_path, :method => "post" do
      assert_select "input#former_user_name", :name => "former_user[name]"
      assert_select "input#former_user_title", :name => "former_user[title]"
      assert_select "textarea#former_user_content", :name => "former_user[content]"
    end
  end
end
