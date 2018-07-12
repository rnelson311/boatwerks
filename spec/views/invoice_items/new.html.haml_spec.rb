require 'rails_helper'

RSpec.describe "invoice_items/new", type: :view do
  before(:each) do
    assign(:invoice_item, InvoiceItem.new(
      :invoice => nil,
      :description => "MyString",
      :unit_cost => 1.5,
      :quantity => 1,
      :discount => 1.5,
      :amount => 1.5
    ))
  end

  it "renders new invoice_item form" do
    render

    assert_select "form[action=?][method=?]", invoice_items_path, "post" do

      assert_select "input[name=?]", "invoice_item[invoice_id]"

      assert_select "input[name=?]", "invoice_item[description]"

      assert_select "input[name=?]", "invoice_item[unit_cost]"

      assert_select "input[name=?]", "invoice_item[quantity]"

      assert_select "input[name=?]", "invoice_item[discount]"

      assert_select "input[name=?]", "invoice_item[amount]"
    end
  end
end
