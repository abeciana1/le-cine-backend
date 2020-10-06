class ClubWatchlist < ApplicationRecord
    belongs_to :club
    belongs_to :movie
end
