class PassengerMailer < ApplicationMailer
  default from: "airstroll@noreply.com"
  def confirmation(passenger)
    @passenger = passenger
    email = passenger.email
    @booking = passenger.booking
    mail(to: email, subject: 'Your Flight Has been successfully Booked')
  end
end
