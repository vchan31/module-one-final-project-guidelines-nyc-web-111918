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
