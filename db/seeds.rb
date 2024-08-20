# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   


require 'date'

Airport.create(name: "Salt Lake City" , code: "SLC")
Airport.create(name: "Honolulu" , code: "HNL")
Airport.create(name: "Kansas City" , code: "MCI")
Airport.create(name: "Long Beach" , code: "LGB")
Airport.create(name: "San Fransisco" , code: "SFO")


airports = Airport.all

random_date = Date.today + rand(1..30)

10.times do |t|
departure_airport = airports.sample
arrival_airport = (airports - [departure_airport]).sample
  Flight.create!(
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    start_time: random_date.to_time,
    duration: (30..240).to_a.sample
  )
end