Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :meetings
      resources :movie_meetings
      resources :movies
      resources :watchlists
      resources :club_watchlists
      resources :clubs
      resources :user_clubs
      resources :users
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
