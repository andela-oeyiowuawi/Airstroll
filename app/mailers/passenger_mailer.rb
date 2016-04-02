class PassengerMailer < ApplicationMailer
  default from: "airstroll@noreply.com"
  def confirmation(name, email, booking)
    passenger_and_booking(name,booking)
    mail(to: email, subject: "Your Flight Has been successfully Booked")
  end

  def update_mail(name,email, booking)
    passenger_and_booking(name,booking)
    mail(to: email, subject: "Updated Flight details")
  end

  def passenger_and_booking(name,booking)
    @passenger = name
    @booking = booking
  end
end
