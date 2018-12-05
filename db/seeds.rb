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

def random_zip_in_manhattan
  [10026, 10027, 10030, 10037, 10039, 10001, 10011, 10018, 10019,
  10020, 10036, 10029, 10035, 10010, 10016, 10017, 10022, 10012,
  10013, 10014, 10004, 10005, 10006, 10007, 10038, 10280, 10002,
  10003, 10009, 10021, 10028, 10044, 10065, 10075, 10128, 10023,
  10024, 10025,10031, 10032, 10033, 10034, 10040].sample
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

#Please correct spelling of address to "cardboard"
Property.find_or_create_by(
  {address: "Carboard Box House",
  zip: 11111,
  cost: 2,
  monthly_cost: 100,
  year_built: 2018,
  availibity: true,
  amenities: "sidewalk and new cardboard smell",
  proximity_to_subway: 1,
  sqft: 5,
  days_on_market: 6,
  description: "Brand new box, only had one previous owner, it was a Samsung T.V."}
)
Property.find_or_create_by(
  {address: "432 Park Ave PH95",
  zip: 10022,
  cost: 82000000,
  monthly_cost: 30000,
  year_built: 2015,
  availibity: true,
  amenities: "Elevator, Doorman, Gym, Pool",
  proximity_to_subway: 2,
  sqft: 8255,
  days_on_market: 776,
  description: "Cental Park views, Billionares row, Iconic building"}
)

Appointment.find_or_create_by(
  {user_id: 1,
  property_id: 1,
  date: "Thu, 06 Dec 2018",
  time: "12:56:38"}
)

Appointment.find_or_create_by(
  {user_id: 2,
  property_id: 1,
  date: "Tue, 18 Dec 2018",
  time: "11:56:38"}
)
Appointment.find_or_create_by(
  {user_id: 3,
  property_id: 1,
  date: "Tue, 18 Dec 2018",
  time: "11:56:38"}
)
Appointment.find_or_create_by(
  {user_id: 3,
  property_id: 2,
  date: "Tue, 25 Dec 2018",
  time: "16:30:22"}
)

25.times do
  User.create(
    {first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    budget:(300000..4000000).to_a.sample,
    credit_score:(700..850).to_a.sample,
    income:(0..1000000).to_a.sample,
    days_searching:(1..365).to_a.sample,
    active: [true, true, true, true, true, false].sample,
    phone_number:(7185550000..7185559999).to_a.sample.to_s,
    email:Faker::Internet.email}
  )
end

300.times do
  Property.create(
    {address: "#{Faker::Address.street_address} #{Faker::Address.secondary_address}",
    zip: random_zip_in_manhattan,
    cost: Faker::Number.between(500000, 4000000),
    monthly_cost: Faker::Number.between(500, 3000),
    year_built: Faker::Number.between(1950, 2018),
    availibity: [true, true, true, true, true, false].sample,
    amenities: ranamen,
    proximity_to_subway: Faker::Number.between(0.0, 4.0).round(2),
    sqft: Faker::Number.between(400, 2000),
    days_on_market: Faker::Number.between(0, 180),
    description: fakedis}
  )
end


50.times do
  Appointment.create(
    {user_id: (1..User.count).to_a.sample,
    property_id: (1..Property.count).to_a.sample,
    date: Faker::Date.forward((1..30).to_a.sample),
    time: Faker::Time.forward(1, :afternoon).to_s.split[1]}
  )
end
