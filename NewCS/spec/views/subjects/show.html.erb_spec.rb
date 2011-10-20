require 'spec_helper'

describe "subjects/show.html.erb" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject))
  end

  it "renders attributes in <p>" do
    render
  end
end
