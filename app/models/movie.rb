class Movie < ApplicationRecord
    has_many :watchlists
    has_many :users, through: :watchlists
    has_many :club_watchlists
    has_many :clubs, through: :club_watchlists
    has_many :movie_meetings
    has_many :meetings, through: :movies
end
