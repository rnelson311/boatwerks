require 'rails_helper'

RSpec.describe Client, type: :model do
  before(:all) do
    @client = create(:client)
  end
  context "with valid data" do
    it "should be valid" do
      expect(@client).to be_valid
    end
  end
  context "with invalid data" do
    it "should not be valid with invalid data" do
      @client.update_attributes(first_name: "",
                                last_name: "",
                                email: "",
                                phone: "")
      expect(@client).to_not be_valid
    end
    it "should not be valid without a first name" do
      @client.first_name = ""
      expect(@client).to_not be_valid
    end
    it "should not be valid without a last name" do
      @client.last_name = ""
      expect(@client).to_not be_valid
    end
    it "should not be valid without a phone" do
      @client.phone = ""
      expect(@client).to_not be_valid
    end
    it "should not be valid without an email" do
      @client.email = ""
      expect(@client).to_not be_valid
    end
  end
  context "email validation" do
    it "should accept valid emails" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @client.email = valid_address
        expect(@client).to be_valid
      end
    end
    it "should not allow long emails" do
      @client.email = "a" * 244 + "@example.com"
      expect(@client).to_not be_valid
    end
    it "should reject invalid email addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @client.email = invalid_address
        expect(@client).to_not be_valid
      end
    end
    it "should reject non unique emails" do
      duplicate_client = @client.dup
      duplicate_client.email = @client.email.upcase
      @client.save
      expect(@client).to_not be_valid
    end
    it "should save emails as lower case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      @client.email = mixed_case_email
      @client.save
      expect(@client.email).to eq(mixed_case_email.downcase)
    end
  end
end
