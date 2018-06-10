require 'rails_helper'

RSpec.describe "boats/show", type: :view do
  before(:each) do
    @boat = assign(:boat, Boat.create!(
      :name => "Name",
      :manufacturer => "Manufacturer",
      :model => "Model",
      :construction => "Construction",
      :boat_type => "Boat Type",
      :identification => "Identification",
      :client => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Construction/)
    expect(rendered).to match(/Boat Type/)
    expect(rendered).to match(/Identification/)
    expect(rendered).to match(//)
  end
end
