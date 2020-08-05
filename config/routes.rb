Rails.application.routes.draw do
  # resources :password_resets
  get 'animals/no_canvas_photo', to: 'animals#no_canvas_photos' 
  get 'animals/print_ready', to: 'animals#print_ready_photos' 
  post 'animals/profile_photo/:photo_id', to: 'animals#update_profile_photo' 
  post 'animals/canvas_photo/:id', to: 'animals#create_canvas_photo' 
  # patch '/animals/canvas_photo/:photo_id', to: 'animals#update_canvas_photo' 
  get 'animals/name/:name', to: 'animals#get_by_name'
  get 'animals/card_generator/:id', to: 'animals#card_generator'
  resources :uploads, :only => [:create]
  resources :photos
  resources :galleries
  resources :paint_locations
  resources :shelters
  resources :paintings
  resources :animals
  resources :users
  get 'google_drive', to: 'google_drive#index'
  post 'google_drive', to: 'google_drive#create'
  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  
  # Auth routes 
  post 'auth', to: 'auth#create'
  get 'current_user', to: 'auth#show'
  post 'password_resets', to: 'password_resets#create'
  patch 'password_resets/:token', to: 'password_resets#update'
  patch 'permissions/:id', to: 'permissions#update'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
