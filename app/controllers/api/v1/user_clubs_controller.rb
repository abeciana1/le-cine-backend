require 'pry'

class Api::V1::UserClubsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :destroy, :find_user_club]
    
    def index
        user_clubs = UserClub.all
        render :json => user_clubs, each_serializer: UserClubSerializer
    end

    def show
        user_club = UserClub.find(params[:id])
        render :json => user_club, each_serializer: UserClubSerializer
    end

    def find_user_club
        user_club = UserClub.find_by(user_club_params)
        render :json => user_club, each_serializer: UserClubSerializer
        # binding.pry
    end
    
    def create
        user_club = UserClub.create(user_club_params)
        if user_club.valid?
            render json: {user_club: UserClubSerializer.new(user_club)}, status: :created
        else
            render json: { error: 'failed to become member'}, status: :not_acceptable
        end
    end

    def update
        user_club = UserClub.find(params[:id])
        user_club.update(user_club_params)
        render :json => user_club, each_serializer: UserClubSerializer
    end
    
    def destroy
        user_club = UserClub.find(params[:id])
        user_club.destroy
        render json: {}
    end
    
    private
    
    def user_club_params
        params.require(:user_club).permit(:user_id, :club_id)
    end
    
    
end
