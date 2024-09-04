class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookings_as_creator = current_user.bookings
    @bookings_as_passenger = Booking.joins(:passengers).where(passengers: { email: current_user.email})

    # Combine the results and remove duplicates
    @all_current_user_bookings = (@bookings_as_creator + @bookings_as_passenger).uniq
    
    # @booking = Booking.find(params[:id]) 
    # @flight = @booking.flight if @booking.present?
    # @passengers = @booking.passengers if @booking.present?

  end
end
