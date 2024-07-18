class BookingsController < ApplicationController
  def new
    total_passengers = params[:passengers].to_i
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passengers = total_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create!(booking_params)

    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
