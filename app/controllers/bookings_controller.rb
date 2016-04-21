class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy, :show, :edit]
  before_action :verify_login, only: :index

  def create
    if booking_params[:passengers_attributes].nil?
      redirect_to :back, alert: "You must have at least one passenger"
    else
      booking = Booking.new(booking_params)
      if booking.save
        mail_sender(booking)
        redirect_to booking_path(booking)
      else
        redirect_to :back, alert: "Booking failed. Try again!!"
      end
    end
  end

  def index
    @bookings = current_user.bookings
  end

  def edit
    @flight = @booking.flight
    @number_of_passengers = @booking.no_of_passenger.to_i
  end

  def update
    if @booking.update(booking_params)
      current_user ? mail_sender(@booking, true) : mail_sender(@booking)
      if current_user
        redirect_to user_profile_path, notice: "Booking successfully updated."
      else
        redirect_to root_path, notice: "Booking successfully updated."
      end
    else
      redirect_to :back, notice: "Error, Booking was not updated, try again"
    end
  end

  def reservation
  end

  def destroy
    if @booking.destroy
      flash[:success] = "Booking cancelled successfully."
    else
      flash[:alert] = "Unable to cancel the booking, please contact the admin."
    end
    redirect_to user_profile_path
  end

  def find_reservation
    @reservation = Booking.find_booking(params[:bcode])
    if !current_user && @reservation.nil?
      redirect_to root_path, alert: "Invalid Booking Code!"
    elsif !current_user && !@reservation.nil?
      redirect_to edit_booking_path(@reservation)
    end
  end

  def show
    @flight = Flight.find(@booking.flight_id)
  end

  def new
    @flight = Flight.find(params[:id])
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :no_of_passenger, :flight_id,
                                    passengers_attributes: [:id, :name,
                                                            :email, :_destroy])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def mail_sender(booking, update = false)
    if current_user && update
      PassengerMailer.update_mail(current_user.name, current_user.email,
                                  booking).deliver_now
    elsif current_user
      PassengerMailer.confirmation(current_user.name,
                                   current_user.email, booking).deliver_later
    else
      passengers = booking.passengers
      passengers.each do |passenger|
        PassengerMailer.confirmation(passenger.name,
                                     passenger.email, booking).deliver_later
      end
    end
  end

  def verify_login
    unless current_user
      redirect_to root_path, alert: "You have to be logged in "
    end
  end
end
