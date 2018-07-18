require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :client => nil,
      :boat => nil,
      :tax => 1.5,
      :subtotal => 1.5,
      :total => 1.5,
      :is_payed => false
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input[name=?]", "invoice[client_id]"

      assert_select "input[name=?]", "invoice[boat_id]"

      assert_select "input[name=?]", "invoice[tax]"

      assert_select "input[name=?]", "invoice[subtotal]"

      assert_select "input[name=?]", "invoice[total]"

      assert_select "input[name=?]", "invoice[is_payed]"
    end
  end
end
