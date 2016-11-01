Rails.application.routes.draw do
  get 'bookings/create'

  root 'bookings#new'
end
