Rails.application.routes.draw do

  resources :movie_records
  namespace :api do
    namespace :v1 do
      resources :meetings
      resources :movie_meetings
      post '/search', to: 'movies#search'
      post 'details', to: 'movies#details'
      resources :movies
      resources :watchlists
      resources :club_watchlists
      resources :clubs
      resources :user_clubs
      resources :users
      resources :notifications
      resources :subscribers
      post '/find-club-by-name', to: 'clubs#find_by_name'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/find-club', to: 'user_clubs#find_user_club'
      post '/find-club-watchlist', to: 'club_watchlists#find_club_watchlist'
      post '/alert-users', to: 'notifications#alert_users'
      # post '/search', to: 'movie_records#create'
      # post 'search', to: 'movierecords#create'
      
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
