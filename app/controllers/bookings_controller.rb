class BookingsController < ApplicationController

  def create
    booking = Booking.new(booking_params)
    if booking.save
      
    else
      redirect_to new_booking_path, notice: "Booking failed. Please try again."
    end
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
    params.require(:booking).permit(:no_of_passenger, :confirmation_code, :flight_id, passengers_attributes: [:name, :email])
  end

end
