require 'rails_helper'

RSpec.describe "marinas/edit", type: :view do
  before(:each) do
    @marina = assign(:marina, Marina.create!(
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ))
  end

  it "renders the edit marina form" do
    render

    assert_select "form[action=?][method=?]", marina_path(@marina), "post" do

      assert_select "input[name=?]", "marina[name]"

      assert_select "input[name=?]", "marina[address1]"

      assert_select "input[name=?]", "marina[address2]"

      assert_select "input[name=?]", "marina[city]"

      assert_select "input[name=?]", "marina[state]"

      assert_select "input[name=?]", "marina[zip_code]"
    end
  end
end
