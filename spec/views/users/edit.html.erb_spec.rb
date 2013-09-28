require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :year => 1,
      :program => "MyString",
      :faculty => "MyString",
      :phone => 1,
      :registerterms => false
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
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
