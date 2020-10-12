class Api::V1::ClubWatchlistsController < ApplicationController
    
    def index
        club_watchlists = ClubWatchlist.all
        render :json => club_watchlists, each_serializer: ClubWatchlistSerializer
    end
    
    def show
        club_watchlist = ClubWatchlist.find(params[:id])
        render :json => club_watchlist, each_serializer: ClubWatchlistSerializer
    end
    
    def create

        club_watchlist = ClubWatchlist.create(club_watchlist_params)
        if club_watchlist.valid?
            render json: {club_watchlist: ClubWatchlistSerializer.new(club_watchlist)}, status: :created
        else
            render json: { error: 'failed to create club watchlist'}, status: :not_acceptable
        end
    end
    
    def update
        club_watchlist = ClubWatchlist.find(params[:id])
        club_watchlist.update(club_watchlist_params)
        render :json => club_watchlist, each_serializer: ClubWatchlistSerializer
    end
    
    def delete
        club_watchlist = ClubWatchlist.find(params[:id])
        club_watchlist.destroy
        render json: {}
    end
    
    private
    
    def club_watchlist_params
        params.require(:club_watchlist).permit(:club_id, :movie_id)
    end
    
    
end
