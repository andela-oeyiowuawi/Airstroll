Rails.application.routes.draw do
  # get 'session/create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'flight#index'
  post 'flight/search' => 'flight#search'
  get  'flight/all' => 'flight#all', as: 'flights'
  get 'flight/show' => 'flight#show'
  resources :bookings
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'userprofile' => 'bookings#index', as: 'user_profile'
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'reservation' => 'bookings#reservation'
  post 'findreservation' => 'bookings#find_reservation', as: :find_reservation
  get 'cancel' => 'bookings#destroy', as: :cancel
  # get 'booking_confirmed/:id', to: 'bookings#show', as: 'booking_confirmed'
  # resource :flight
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
