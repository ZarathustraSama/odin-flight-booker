Rails.application.routes.draw do
  resources :bookings, only: %i[new create show]
  resources :flights, only: [:index]

  root 'flights#index'
end
