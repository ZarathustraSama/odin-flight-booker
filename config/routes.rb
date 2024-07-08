Rails.application.routes.draw do
  get 'flight/index'
  resources :flights, only: [:index]

  root 'flight#index'
end
