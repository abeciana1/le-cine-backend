class User < ApplicationRecord
    has_many :user_clubs
    has_many :clubs, through: :user_clubs
    has_many :host_clubs, foreign_key: "host_id", class_name: "Club"
    has_many :watchlists
    has_many :movies, through: :watchlists
    has_secure_password
end
