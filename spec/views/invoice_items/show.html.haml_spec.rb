require 'rails_helper'

RSpec.describe "invoice_items/show", type: :view do
  before(:each) do
    @invoice_item = assign(:invoice_item, InvoiceItem.create!(
      :invoice => nil,
      :description => "Description",
      :unit_cost => 2.5,
      :quantity => 3,
      :discount => 4.5,
      :amount => 5.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
  end
end
