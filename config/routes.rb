Rails.application.routes.draw do
  # root
  root 'static#home'

  # reservations
  get '/reservations', to: 'reservations#index'
  get '/reservation/:id', to: 'reservations#show', as: 'reservation'
  get '/reservations/new', to: 'reservations#new'
  post '/reservations', to: 'reservations#create'
  get '/reservations/:id/edit', to: 'reservations#edit', as: 'edit_reservation'

  # activities
  get '/activities', to: 'activities#index'
  get '/activities/:id', to: 'activities#show', as: 'activity'
end
