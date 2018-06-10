require 'rails_helper'

RSpec.describe "boats/new", type: :view do
  before(:each) do
    assign(:boat, Boat.new(
      :name => "MyString",
      :manufacturer => "MyString",
      :model => "MyString",
      :construction => "MyString",
      :boat_type => "MyString",
      :identification => "MyString",
      :client => nil
    ))
  end

  it "renders new boat form" do
    render

    assert_select "form[action=?][method=?]", boats_path, "post" do

      assert_select "input[name=?]", "boat[name]"

      assert_select "input[name=?]", "boat[manufacturer]"

      assert_select "input[name=?]", "boat[model]"

      assert_select "input[name=?]", "boat[construction]"

      assert_select "input[name=?]", "boat[boat_type]"

      assert_select "input[name=?]", "boat[identification]"

      assert_select "input[name=?]", "boat[client_id]"
    end
  end
end
