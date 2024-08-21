class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
  #   @flight_params = params[:flight_params] || {}
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "Your Flight Was Booked"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end
  
  
  # def booking_params
  #   params.require(:booking).permit(:flight_id, :passenger_name)
  # end

end 
