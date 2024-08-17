class AddAirportReferenceToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :departure_airport_id, :integer, null: false
    add_column :flights, :arrival_airport_id, :integer, null: false

    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
    end

end
