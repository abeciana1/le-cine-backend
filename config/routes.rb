Rails.application.routes.draw do
  resources :meetings
  resources :movie_meetings
  resources :movies
  resources :watchlists
  resources :club_watchlists
  resources :clubs
  resources :user_clubs
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
