Rails.application.routes.draw do
  # resources :password_resets
  resources :photos
  resources :galleries
  resources :paint_locations
  resources :shelters
  resources :paintings
  resources :animals
  resources :users
  get '/google_drive', to: 'google_drive#index'
  post '/google_drive', to: 'google_drive#create'
  get '/animals_by_name/:name', to: 'animals#get_by_name'
  get '/card_generator/:id', to: 'card_generator#show'
  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  
  # Auth routes 
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  post '/password_resets', to: 'password_resets#create'
  patch '/password_resets/:token', to: 'password_resets#update'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
