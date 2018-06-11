require 'rails_helper'

RSpec.describe "boats/new", type: :view do
  before(:each) do
    client = create(:client)
    assign(:boat, Boat.new(
      :name => "MyString",
      :manufacturer => "MyString",
      :model => "MyString",
      :construction => "MyString",
      :boat_type => "MyString",
      :identification => "MyString",
      :client => client
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

    end
  end
end
