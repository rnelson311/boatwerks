require 'rails_helper'

RSpec.describe "boats/index", type: :view do
  before(:each) do
    client1 = create(:client, email: 'test@test.com')
    client2 = create(:client, email: 'example@exapmple.com')
    assign(:boats, [
      Boat.create!(
        :name => "Name",
        :manufacturer => "Manufacturer",
        :model => "Model",
        :construction => "Construction",
        :boat_type => "Boat Type",
        :identification => "Identification",
        :client => client1
      ),
      Boat.create!(
        :name => "Name",
        :manufacturer => "Manufacturer",
        :model => "Model",
        :construction => "Construction",
        :boat_type => "Boat Type",
        :identification => "Identification",
        :client => client2
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
  end
end
