require 'pry'
require 'json'
require 'uri'
require 'net/http'
require 'openssl'
require "dotenv"
Dotenv.load
require "rest-client"

class Movie < ApplicationRecord
    has_many :watchlists
    has_many :users, through: :watchlists
    has_many :club_watchlists
    has_many :clubs, through: :club_watchlists
    has_many :movie_meetings
    has_many :meetings, through: :movies

    def self.results(title)
        key = ENV['TMDB_API_KEY']
        mov_title = title.split(' ').join('%20')
        res = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{key}&language=en-US&query=#{mov_title}&page=1&include_adult=false")
        return res[]
    end

end