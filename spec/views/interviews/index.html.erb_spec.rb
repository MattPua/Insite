require 'spec_helper'

describe "interviews/index" do
  before(:each) do
    assign(:interviews, [
      stub_model(Interview),
      stub_model(Interview)
    ])
  end

  it "renders a list of interviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
