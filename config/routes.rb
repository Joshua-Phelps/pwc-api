Rails.application.routes.draw do
  # resources :password_resets
  get '/photos/full_background', to: 'photos#full_background' 
  get '/photos/print_ready', to: 'photos#print_ready' 
  post '/animals/update_profile_photo/:id', to: 'animals#update_profile_photo' 
  post '/photos/create_canvas_photo/:animal_id', to: 'photos#create_canvas_photo' 
  patch '/photos/update_canvas_photo/:animal_id', to: 'photos#update_canvas_photo' 
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
  patch '/permissions/:id', to: 'permissions#update'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
