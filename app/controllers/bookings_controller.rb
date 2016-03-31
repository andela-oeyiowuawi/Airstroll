class BookingsController < ApplicationController

  def create
    booking = Booking.new(booking_params)
    if booking.save
      mail_sender(booking)
      redirect_to booking_path(booking)
    else
      redirect_to new_booking_path, notice: "Booking failed. Please try again."
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
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

  def mail_sender(booking)
    passengers = booking.passengers
    passengers.each{ |passenger| PassengerMailer.confirmation(passenger).deliver_later}
  end

end
