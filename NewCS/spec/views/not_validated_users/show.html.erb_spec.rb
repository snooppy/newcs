require 'spec_helper'

describe "not_validated_users/show.html.erb" do
  before(:each) do
    @not_validated_user = assign(:not_validated_user, stub_model(NotValidatedUser,
      :login => "Login",
      :password => "Password",
      :second_name => "Second Name",
      :last_name => "Last Name",
      :email => "Email",
      :sex => "Sex",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Login/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Second Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sex/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role/)
  end
end
