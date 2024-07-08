# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

%w[AAL AES AAR YXX ABZ ABR ABJ ABI AUH ABV ACA SFO NYC].each do |code|
  Airport.find_or_create_by!(code:)
end

Flight.create!([{
                 departure_id: 1,
                 arrival_id: 2,
                 start_datetime: '2024-09-11 09:00:00',
                 flight_duration: 130
               },
                {
                  departure_id: 4,
                  arrival_id: 1,
                  start_datetime: '2024-09-11 13:30:00',
                  flight_duration: 220
                },
                {
                  departure_id: 2,
                  arrival_id: 1,
                  start_datetime: '2025-11-12 12:00:00',
                  flight_duration: 150
                },
                {
                  departure_id: 3,
                  arrival_id: 4,
                  start_datetime: '2024-08-08 20:00:00',
                  flight_duration: 90
                }])
