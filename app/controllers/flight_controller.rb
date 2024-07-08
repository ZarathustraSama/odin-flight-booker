class FlightController < ApplicationController
  def index
    @flights = Flight.where(flight_params.except[:passengers])
    @departing_options = []
    @arrival_options = []
    @datetime_options = []
    Flight.all.map do |f|
      @departing_options << [f.departure_airport.code, f.departure_airport.id]
      @arrival_options << [f.arrival_airport.code, f.arrival_airport.id]
      @datetime_options << [f.start_datetime.strftime('%d/%m/%y'), f.start_datetime.to_date]
    end
  end

  private

  def flight_params
    params.permit(:departure_id, :arrival_id, :start_datetime, :passengers)
  end
end
