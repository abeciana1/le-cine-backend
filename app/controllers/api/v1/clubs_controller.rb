require "pry"

class Api::V1::ClubsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy, :find_by_name]

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
            render json: {club: ClubSerializer.new(club)}, status: :created
        else
            render json: { error: 'failed to create club' }, status: :not_acceptable
        end
    end

    def find_by_name
        club = Club.find_by(name: club_params["name"])
        render :json => club, each_serializer: ClubSerializer
    end
    
    def update
        club = Club.find(params[:id])
        club.update(club_params)
        render :json => club, each_serializer: ClubSerializer
    end
    
    def destroy
        club = Club.find(params[:id])
        club.destroy
        render json: {}
    end
    
    private
    
    def club_params
        params.require(:club).permit(:name, :about, :city, :state, :country, :image, :member_count, :member_capacity, :privacy, :host_id)
        # params.require(:club).permit(:name, :about, :city, :state, :country, :member_count, :member_capacity, :privacy, :host_id)
    end
    
    
end
