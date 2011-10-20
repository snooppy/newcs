require 'spec_helper'

describe "publications_types/new.html.erb" do
  before(:each) do
    assign(:publications_type, stub_model(PublicationsType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new publications_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publications_types_path, :method => "post" do
      assert_select "input#publications_type_name", :name => "publications_type[name]"
    end
  end
end
