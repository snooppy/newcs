require 'spec_helper'

describe "publication_cats/new.html.erb" do
  before(:each) do
    assign(:publication_cat, stub_model(PublicationCat,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new publication_cat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publication_cats_path, :method => "post" do
      assert_select "input#publication_cat_name", :name => "publication_cat[name]"
    end
  end
end
