Rails.application.routes.draw do
  resources :bookings, only: [:new, :create]
  post 'bookings/successful_callback'

  root 'bookings#new'
end
