require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[first_name]"

      assert_select "input[name=?]", "client[last_name]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[email]"
    end
  end
end
