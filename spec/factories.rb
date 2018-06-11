FactoryBot.define do
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
    fuel_type 'gas'
    propulsion 'outboard'
    engine 'cummins 4bt'
    engine_count 1
    hailing_port 'San Diego'
    association :client, factory: :client
  end
end
