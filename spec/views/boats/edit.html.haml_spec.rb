require 'rails_helper'

RSpec.describe "boats/edit", type: :view do
  before(:each) do
    @client = create(:client)
    @boat = create(:boat, client: @client)
  end

  it "renders the edit boat form" do
    render

    assert_select "form[action=?][method=?]", boat_path(@boat), "post" do

      assert_select "input[name=?]", "boat[name]"

      assert_select "input[name=?]", "boat[manufacturer]"

      assert_select "input[name=?]", "boat[model]"

      assert_select "input[name=?]", "boat[construction]"

      assert_select "input[name=?]", "boat[boat_type]"

      assert_select "input[name=?]", "boat[identification]"
    end
  end
end
