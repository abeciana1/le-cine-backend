require 'pry'

class Api::V1::WatchlistsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create, :destroy]
    
    def index
        # binding.pry
        watchlists = Watchlist.all
        render :json => watchlists, each_serializer: WatchlistSerializer
    end
    
    def show
        watchlist = Watchlist.find(params[:id])
        render :json => watchlist, each_serializer: WatchlistSerializer
    end
    
    def create
        # binding.pry
        watchlist = Watchlist.create(watchlist_params)
        if watchlist.valid?
            render json: { watchlist: WatchlistSerializer.new(watchlist)}, status: :created
        else
            render json: { error: 'failed to create watchlist'}, status: :not_acceptable
        end
    end
    
    def update
        watchlist = Watchlist.find(params[:id])
        watchlist.update(watchlist_params)
        render :json => watchlist, each_serializer: WatchlistSerializer
    end
    
    def destroy
        # binding.pry
        watchlist = Watchlist.find(params[:id])
        watchlist.destroy
        render json: {}
    end
    
    private
    
    def watchlist_params
        params.require(:watchlist).permit(:user_id, :movie_id)
    end
    
    
end
