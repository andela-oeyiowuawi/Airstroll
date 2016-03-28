class BookingsController < ApplicationController

  def create
  end

  def new
    @flight = Flight.find(params[:id])
    @number_of_passengers = params[:passenger].to_i
    @booking = Booking.new
    @booking.passengers.build if params[:passenger].blank?
    @number_of_passengers.times { @booking.passengers.build }
  end
  private
  def booking_params
    params.require(:booking).permit(:no_of_passengers, :confirmation_code, :flight_id, passengers_attributes:[ :id, :name, :email])
  end

end
