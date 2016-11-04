Rails.application.routes.draw do
  resources :bookings, only: [:new, :create]
  root 'bookings#new'
end
