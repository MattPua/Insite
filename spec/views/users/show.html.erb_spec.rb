require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email",
      :year => 1,
      :program => "Program",
      :faculty => "Faculty",
      :phone => 2,
      :registerterms => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/Program/)
    rendered.should match(/Faculty/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
