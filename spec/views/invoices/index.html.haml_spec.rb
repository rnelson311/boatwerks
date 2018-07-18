require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :client => nil,
        :boat => nil,
        :tax => 2.5,
        :subtotal => 3.5,
        :total => 4.5,
        :is_payed => false
      ),
      Invoice.create!(
        :client => nil,
        :boat => nil,
        :tax => 2.5,
        :subtotal => 3.5,
        :total => 4.5,
        :is_payed => false
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
