Rails.application.routes.draw do
  resources :gallery_paintings
  resources :photos
  resources :galleries
  resources :paint_locations
  resources :shelters
  resources :paintings
  resources :animals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
