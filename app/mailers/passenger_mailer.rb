class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    @passenger = params[:passenger]
    @flight_id = params[:flight_id]
    mail(to: @passenger.email, subject: 'Booking Confirmation')
  end
end
