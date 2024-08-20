class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all
    @flight_params = params.permit(:departure_airport_code, :arrival_airport_code, :passengers)
    @search_results = @flights.select do |f|
      f.departure_airport.code == @flight_params[:departure_airport_code] &&
      f.arrival_airport.code == @flight_params[:arrival_airport_code]
    end

  
    # @flight_params = params[]

  end
end
