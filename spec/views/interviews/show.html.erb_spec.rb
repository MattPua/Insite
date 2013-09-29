require 'spec_helper'

describe "interviews/show" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :company_name => "Company Name",
      :position => "Position"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    rendered.should match(/Position/)
  end
end
