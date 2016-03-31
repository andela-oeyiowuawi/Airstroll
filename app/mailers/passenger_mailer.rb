class PassengerMailer < ApplicationMailer
  default from: "airstroll@noreply.com"
  def confirmation(name,email,booking)
    @passenger = name
    @booking = booking
    mail(to: email, subject: 'Your Flight Has been successfully Booked')
  end
end
