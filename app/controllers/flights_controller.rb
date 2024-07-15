class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airport_codes = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.all.map { |f| [f.date.strftime('%d/%m/%y'), f.date] }.uniq
    return unless params[:commit]

    f = Flight.where(['departure_id = ? AND arrival_id = ? AND date = ?',
                      params[:departure_id],
                      params[:arrival_id],
                      params[:date]]) || []
    @flights = f.map do |flight|
      {
        departure_code: flight.departure_airport.code,
        arrival_code: flight.arrival_airport.code,
        flight_date: flight.date,
        flight_id: flight.id
      }
    end
    @passengers = params[:passengers]
  end
end
