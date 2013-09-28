require 'spec_helper'

describe "interviews/new" do
  before(:each) do
    assign(:interview, stub_model(Interview).as_new_record)
  end

  it "renders new interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path, :method => "post" do
    end
  end
end
