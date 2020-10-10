Rails.application.routes.draw do
  resources :movie_records
  namespace :api do
    namespace :v1 do
      resources :meetings
      resources :movie_meetings
      post '/search', to: 'movies#search'
      resources :movies
      resources :watchlists
      resources :club_watchlists
      resources :clubs
      resources :user_clubs
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # post '/search', to: 'movie_records#create'
      # post 'search', to: 'movierecords#create'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
