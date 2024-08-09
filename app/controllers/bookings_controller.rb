class BookingsController < ApplicationController
  def new
    total_passengers = params[:passengers].to_i
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @passengers = total_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save!
        @booking.passengers.each do |p|
          PassengerMailer.with(passenger: p,
                               flight_id: @booking.flight_id).confirmation_email.deliver_later
        end

        format.html { redirect_to(@booking) }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: 'new' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
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
