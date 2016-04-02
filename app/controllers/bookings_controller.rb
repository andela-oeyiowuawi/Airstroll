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
  def index
    @bookings = Booking.where(user_id: session[:user_id])
  end

  def edit
    @booking = Booking.find params[:id]
    @flight = @booking.flight
    @number_of_passengers = @booking.no_of_passenger.to_i
  end

  def update
    @booking.update(booking_params)
    
  end

  def reservation
  end

  def find_reservation
      @reservation = Booking.find_booking(params[:bcode])
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  def new
    @flight = Flight.find(params[:id])
    @number_of_passengers = params[:passenger].to_i
    @booking = Booking.new
    @number_of_passengers = 1 if params[:passenger].blank? || params[:passenger].empty?
    @number_of_passengers.times { @booking.passengers.build }
  end
  private
  def booking_params
    params.require(:booking).permit(:user_id, :no_of_passenger, :confirmation_code, :flight_id, passengers_attributes: [:name, :email])
  end

  def mail_sender(booking)
    if current_user
      PassengerMailer.confirmation(current_user.name,current_user.email, booking).deliver_later
    else
      passengers = booking.passengers
      passengers.each{ |passenger| PassengerMailer.confirmation(passenger.name,passenger.email,booking).deliver_later }
    end

  end

end
