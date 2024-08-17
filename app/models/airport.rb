class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: "departing_flight_id", class_name: "Flight"
  has_many :arriving_flights, foreign_key: "arriving_flight_id", class_name: "Flighs" 
end

