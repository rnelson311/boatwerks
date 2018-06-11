# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
  FactoryBot.create(:client, first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number,
                    address1: Faker::Address.street_address,
                    address2: Faker::Address.secondary_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    zip_code: Faker::Address.zip_code)
end

clients = Client.all
clients.each do |client|
  Random.new.rand(3).times do
    Boat.create!(name: Faker::Lorem.word,
                 manufacturer: Faker::StarWars.vehicle,
                 model: Faker::StarWars.droid,
                 boat_type: %w(power sail).sample,
                 identification: Faker::Code.asin,
                 construction: %w(fiber wood cement other).sample,
                 configuration: %w(ketch sloop cutty trawler sedan other).sample,
                 fuel_type: %w(gas diesel bio).sample,
                 propulsion: %w(inboard outboard other).sample,
                 engine: Faker::StarWars.call_sign,
                 engine_count: Random.new.rand(10),
                 hailing_port: Faker::Address.city,
                 year: rand(1950..2018),
                 client_id: client.id)
  end
end
