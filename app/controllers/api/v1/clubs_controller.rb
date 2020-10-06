class Api::V1::ClubsController < ApplicationController
    
    def index
        clubs = Club.all
        render :json => clubs, each_serializer: ClubSerializer
    end
    
    def show
        club = Club.find(params[:id])
        render :json => club, each_serializer: ClubSerializer
    end
    
    def create
        club = Club.create(club_params)
        if club.valid?
            render json: {club: Club.new(club)}, status: :created
        else
            render json: { error: 'failed to create club' }, status: :not_acceptable
        end
    end

    
    def update
        club = Club.find(params[:id])
        club.update(club_params)
        render :json => club, each_serializer: ClubSerializer
    end
    
    def delete
        club = Club.find(params[:id])
        club.destroy
        render json: {}
    end
    
    private
    
    def club_params
        params.require(:club).permit(:name, :about, :city, :state, :country, :image, :member_count, :memory_capacity, :privacy, :host_id)
    end
    
    
end
