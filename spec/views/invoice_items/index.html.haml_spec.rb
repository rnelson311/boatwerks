require 'rails_helper'

RSpec.describe "invoice_items/index", type: :view do
  before(:each) do
    assign(:invoice_items, [
      InvoiceItem.create!(
        :invoice => nil,
        :description => "Description",
        :unit_cost => 2.5,
        :quantity => 3,
        :discount => 4.5,
        :amount => 5.5
      ),
      InvoiceItem.create!(
        :invoice => nil,
        :description => "Description",
        :unit_cost => 2.5,
        :quantity => 3,
        :discount => 4.5,
        :amount => 5.5
      )
    ])
  end

  it "renders a list of invoice_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
  end
end
