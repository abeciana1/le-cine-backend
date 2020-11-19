class Club < ApplicationRecord
    has_many :user_clubs
    has_many :users, through: :user_clubs
    belongs_to :host, :class_name => "User"
    has_many :club_watchlists
    has_many :movies, through: :club_watchlists
    has_many :meetings
    # has_one_attached :image
end
