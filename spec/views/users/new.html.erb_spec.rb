require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :year => 1,
      :program => "MyString",
      :faculty => "MyString",
      :phone => 1,
      :registerterms => false
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_year", :name => "user[year]"
      assert_select "input#user_program", :name => "user[program]"
      assert_select "input#user_faculty", :name => "user[faculty]"
      assert_select "input#user_phone", :name => "user[phone]"
      assert_select "input#user_registerterms", :name => "user[registerterms]"
    end
  end
end
