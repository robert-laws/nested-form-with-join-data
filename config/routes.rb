Rails.application.routes.draw do
  # root
  root 'static#home'

  # reservations
  resources :reservations
  
  # activities
  get '/activities', to: 'activities#index'
  get '/activities/:id', to: 'activities#show', as: 'activity'
end
