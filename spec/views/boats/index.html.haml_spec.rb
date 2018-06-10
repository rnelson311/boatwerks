require 'rails_helper'

RSpec.describe "boats/index", type: :view do
  before(:each) do
    assign(:boats, [
      Boat.create!(
        :name => "Name",
        :manufacturer => "Manufacturer",
        :model => "Model",
        :construction => "Construction",
        :boat_type => "Boat Type",
        :identification => "Identification",
        :client => nil
      ),
      Boat.create!(
        :name => "Name",
        :manufacturer => "Manufacturer",
        :model => "Model",
        :construction => "Construction",
        :boat_type => "Boat Type",
        :identification => "Identification",
        :client => nil
      )
    ])
  end

  it "renders a list of boats" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Construction".to_s, :count => 2
    assert_select "tr>td", :text => "Boat Type".to_s, :count => 2
    assert_select "tr>td", :text => "Identification".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
