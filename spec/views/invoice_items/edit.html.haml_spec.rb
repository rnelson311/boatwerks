require 'rails_helper'

RSpec.describe "invoice_items/edit", type: :view do
  before(:each) do
    @invoice_item = assign(:invoice_item, InvoiceItem.create!(
      :invoice => nil,
      :description => "MyString",
      :unit_cost => 1.5,
      :quantity => 1,
      :discount => 1.5,
      :amount => 1.5
    ))
  end

  it "renders the edit invoice_item form" do
    render

    assert_select "form[action=?][method=?]", invoice_item_path(@invoice_item), "post" do

      assert_select "input[name=?]", "invoice_item[invoice_id]"

      assert_select "input[name=?]", "invoice_item[description]"

      assert_select "input[name=?]", "invoice_item[unit_cost]"

      assert_select "input[name=?]", "invoice_item[quantity]"

      assert_select "input[name=?]", "invoice_item[discount]"

      assert_select "input[name=?]", "invoice_item[amount]"
    end
  end
end
