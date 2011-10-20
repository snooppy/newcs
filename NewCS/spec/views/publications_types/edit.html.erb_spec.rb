require 'spec_helper'

describe "publications_types/edit.html.erb" do
  before(:each) do
    @publications_type = assign(:publications_type, stub_model(PublicationsType,
      :name => "MyString"
    ))
  end

  it "renders the edit publications_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publications_types_path(@publications_type), :method => "post" do
      assert_select "input#publications_type_name", :name => "publications_type[name]"
    end
  end
end
