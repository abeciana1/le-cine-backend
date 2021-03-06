require 'pry'

class Api::V1::MeetingsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]
    
    def index
        meetings = Meeting.all
        render :json => meetings, each_serializer: MeetingSerializer
    end
    
    def show
        meeting = Meeting.find(params[:id])
        render :json => meeting, each_serializer: MeetingSerializer
    end
    
    def create
        # binding.pry
        meeting = Meeting.create(meeting_params)
        if meeting.valid?
            render json: {meeting: MeetingSerializer.new(meeting)}, status: :created
        else
            render json: {eror: 'failed to create meeting'}, status: :not_acceptable
        end
    end
    
    def update
        meeting = Meeting.find(params[:id])
        meeting.update(meeting_params)
        render :json => meeting, each_serializer: MeetingSerializer
    end
    
    def destroy
        meeting = Meeting.find(params[:id])
        meeting.destroy
        render json: {}
    end
    
    private
    
    def meeting_params
        params.require(:meeting).permit(:date, :time, :link, :title, :about, :excerpt, :club_id)
    end
    
    
end
