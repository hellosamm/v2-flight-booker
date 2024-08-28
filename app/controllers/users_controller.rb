class UsersController < ApplicationController
  def show
    @bookings = current_user.bookings
    @booking = Booking.find(params[:id]) if params[:id].present?
    @flight = @booking.flight if @booking.present?
    @passengers = @booking.passengers if @booking.present?
  end
end
