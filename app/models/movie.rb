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

    def self.results(title) #! Use for search results to find movies
        key = ENV['TMDB_API_KEY']
        mov_title = title.split(' ').join('%20')
        res = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=#{key}&language=en-US&query=#{mov_title}&page=1&include_adult=false")
        return res["results"]
    end

    def self.details(id)
        # binding.pry
        key = ENV['TMDB_API_KEY']
        detail_res = HTTParty.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{key}&language=en-US")
        trailer_res = HTTParty.get("https://api.themoviedb.org/3/movie/#{detail_res["id"]}/videos?api_key=#{key}&language=en-US")
        recommended = HTTParty.get("https://api.themoviedb.org/3/movie/#{detail_res["id"]}/recommendations?api_key=#{key}&language=en-US&page=1")
        credits_res = HTTParty.get("https://api.themoviedb.org/3/movie/#{detail_res["id"]}/credits?api_key=#{key}&language=en-US")
        # binding.pry
        detail_res["trailer"] = trailer_res["results"][0]
        detail_res["recommendations"] = recommended["results"]
        return detail_res
    end

end