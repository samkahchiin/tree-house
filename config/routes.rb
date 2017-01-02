Rails.application.routes.draw do
  resources :bookings, only: [:new, :create]
  post 'bookings/successful_callback'

  get '/:locale' => "home#index"
  root to: "home#index"
end
