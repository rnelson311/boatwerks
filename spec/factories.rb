FactoryBot.define do
  factory :boat do
    name "MyString"
    manufacturer "MyString"
    model "MyString"
    construction "MyString"
    boat_type "MyString"
    identification "MyString"
    client nil
  end
  factory :client do
    first_name 'John'
    last_name 'Smith'
    email 'john@smith.com'
    phone '123-456-7890'
  end
end
