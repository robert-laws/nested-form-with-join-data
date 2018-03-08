Rails.application.routes.draw do
  # root
  root 'static#home'

  # reservations
  get '/reservations', to: 'reservations#index'
  get '/reservation/:id', to: 'reservations#show', as: 'reservation'
end
