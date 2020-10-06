class MovieMeeting < ApplicationRecord
    belongs_to :movie
    belongs_to :meeting
end
