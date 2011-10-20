require 'spec_helper'

describe "publication_cats/show.html.erb" do
  before(:each) do
    @publication_cat = assign(:publication_cat, stub_model(PublicationCat,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
