require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :year => 1,
        :program => "Program",
        :faculty => "Faculty",
        :phone => 2,
        :registerterms => false
      ),
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :year => 1,
        :program => "Program",
        :faculty => "Faculty",
        :phone => 2,
        :registerterms => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Program".to_s, :count => 2
    assert_select "tr>td", :text => "Faculty".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
