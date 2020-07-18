Rails.application.routes.draw do
  resources :photos
  resources :galleries
  resources :paint_locations
  resources :shelters
  resources :paintings
  resources :animals
  resources :users
  get '/card_generator/:id', to: 'card_generator#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
