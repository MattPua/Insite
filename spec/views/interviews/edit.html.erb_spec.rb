require 'spec_helper'

describe "interviews/edit" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :company_name => "MyString",
      :position => "MyString"
    ))
  end

  it "renders the edit interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path(@interview), :method => "post" do
      assert_select "input#interview_company_name", :name => "interview[company_name]"
      assert_select "input#interview_position", :name => "interview[position]"
    end
  end
end
