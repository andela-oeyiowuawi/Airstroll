Rails.application.routes.draw do
  root 'flight#index'
  post "flight/search" => 'flight#search'
  get  "flight/all" => 'flight#all', as: "flights"
  get "flight/show" => 'flight#show'
  resources :bookings
  get "/auth/:provider/callback", to: 'sessions#create'
  get "userprofile" => 'bookings#index', as: "user_profile"
  get "logout", to: 'sessions#destroy', as: :logout
  get "reservation" => 'bookings#reservation'
  post "findreservation" => 'bookings#find_reservation', as: :find_reservation
  get "cancel" => 'bookings#destroy', as: :cancel
end
