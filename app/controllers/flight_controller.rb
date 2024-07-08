class FlightController < ApplicationController
  def index
    @flights = Flight.where(flight_params.except[:passengers])
    @airport_codes = Airport.all.map { |a| [a.code, a.id] }
    @datetime_options = Flight.all.map { |f| [f.start_datetime.strftime('%d/%m/%y'), f.start_datetime.to_date] }.uniq
  end

  private

  def flight_params
    params.permit(:departure_id, :arrival_id, :start_datetime, :passengers)
  end
end
