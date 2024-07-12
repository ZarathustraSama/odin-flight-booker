Rails.application.routes.draw do
  get 'flights/', to: 'flight#index'

  root 'flight#index'
end
