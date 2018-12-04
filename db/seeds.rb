require 'faker'

require 'pry'

def ranamen
  var = []
  3.times {var << Faker::Appliance.equipment}
  var.sort.join(", ")
end

def fakedis
  ["Center of Everything", "Near Trains", "Quiet", "Oversized One Bed Room", "Pet Friendly" "Open Tap", "Fire Place", "Good Eats"].sample(2).join(" & ")
end


User.find_or_create_by(
  {first_name: "Tony",
 last_name: "Lum",
 budget: 900000,
 credit_score: 750,
 income: 100000,
 days_searching: 30,
 active: true,
 phone_number: "5555555555",
 email: "T.Lum@homes.com"})

User.find_or_create_by(
{first_name: "Vincent",
 last_name: "Chang",
 budget: 900000,
 credit_score: 800,
 income: 90000,
 days_searching: 60,
 active: true,
 phone_number: "1234569086",
 email: "vchan313@gmail.com"}
  )

User.find_or_create_by (
{first_name: "Mike",
 last_name: "Cheng",
 budget: 5000000,
 credit_score: 849,
 income: 500000,
 days_searching: 2,
 active: true,
 phone_number: "3455672345",
 email: "m.cheng@flatiron.com"}
  )

5.times do
  Property.create(
    address: "#{Faker::Address.street_address} #{Faker::Address.secondary_address}",
    zip: Faker::Address.zip,
    cost: Faker::Number.between(500000, 4000000),
    monthly_cost: Faker::Number.between(500, 3000),
    year_built: Faker::Number.between(1950, 2018),
    availibity: [true, false].sample,
    amenities: ranamen,
    proximity_to_subway: Faker::Number.between(0.0, 4.0).round(2),
    sqft: Faker::Number.between(400, 2000),
    days_on_market: Faker::Number.between(0, 180),
    description: fakedis
  )

end


10.times do
  Appointment.create(
    user_id: (1..User.count).to_a.sample,
    property_id: (1..Property.count).to_a.sample,
    date: Faker::Date.forward((1..30).to_a.sample),
    time: Faker::Time.forward(1, :afternoon).to_s.split[1]


  )

end