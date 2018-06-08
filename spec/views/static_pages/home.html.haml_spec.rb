require 'rails_helper'

RSpec.describe "static_pages/home.html.haml", type: :view do
  it "displays the application title" do
    render
    expect(rendered).to match(/BoatWerks/)
  end
  it "displays the company name" do
    render
    expect(rendered).to match(/Koru Boat Services/)
  end
end
