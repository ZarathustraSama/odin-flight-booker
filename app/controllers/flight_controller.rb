class FlightController < ApplicationController
  def index
    @flight = Flight.new
    @airport_codes = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.all.map { |f| [f.date.strftime('%d/%m/%y'), f.date] }.uniq
    return unless params[:commit]

    f = Flight.where(['departure_id = ? AND arrival_id = ? AND date = ?',
                      params[:departure_id],
                      params[:arrival_id],
                      params[:date]]) || []
    @flights = f.map { |flight| [flight.departure_airport, flight.arrival_airport, flight.date, flight.id] }
    @passengers = params[:passengers]
  end
end
