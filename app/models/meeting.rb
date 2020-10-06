class Meeting < ApplicationRecord
    belongs_to :club
    has_many :movie_meetings
    has_many :movies, through: :movie_meetings
end
