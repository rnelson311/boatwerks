FactoryBot.define do
  factory :admin do
    
  end
  factory :invoice_item do
    invoice nil
    description "MyString"
    unit_cost 1.5
    quantity 1
    discount 1.5
    amount 1.5
  end
  factory :invoice do
    client nil
    boat nil
    date "2018-07-12"
    tax 1.5
    subtotal 1.5
    total 1.5
    is_payed false
  end
  factory :marina do
    name Faker::Company.name
    address1 Faker::Address.street_address
    address2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip_code
  end
  factory :client do
    first_name 'John'
    last_name 'Smith'
    email Faker::Internet.email
    phone '123-456-7890'
  end

  factory :boat do
    name Faker::Dune.character
    manufacturer Faker::Artist.name
    model Faker::Ancient.titan
    boat_type "power"
    identification Faker::Code.asin
    configuration 'cutty'
    construction 'wood'
    fuel_type 'gas'
    propulsion 'outboard'
    engine 'cummins 4bt'
    engine_count 1
    hailing_port 'San Diego'
    association :client, factory: :client
    association :marina, factory: :marina
  end
end
