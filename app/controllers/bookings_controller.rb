class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)

    params[:passenger_count].to_i.times { @booking.passengers.build }

  
  end

  def create
    @booking = current_user.bookings.new(booking_params)

    if @booking.save
      flash[:notice] = "Your Flight Was Booked"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers

    @all_bookings = Booking.joins(:passengers).where(passengers: { email: current_user.email })
    @current_user_flights = @all_bookings.map(&:flight).uniq
  end
  

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
  

end 

