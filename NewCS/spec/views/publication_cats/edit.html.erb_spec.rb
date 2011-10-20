require 'spec_helper'

describe "publication_cats/edit.html.erb" do
  before(:each) do
    @publication_cat = assign(:publication_cat, stub_model(PublicationCat,
      :name => "MyString"
    ))
  end

  it "renders the edit publication_cat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => publication_cats_path(@publication_cat), :method => "post" do
      assert_select "input#publication_cat_name", :name => "publication_cat[name]"
    end
  end
end
