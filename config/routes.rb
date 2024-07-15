Rails.application.routes.draw do
  get 'booking/new'
  get 'booking/show'
  get 'flights/', to: 'flight#index'

  root 'flight#index'
end
