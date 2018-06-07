require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input[name=?]", "client[first_name]"

      assert_select "input[name=?]", "client[last_name]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[email]"
    end
  end
end
