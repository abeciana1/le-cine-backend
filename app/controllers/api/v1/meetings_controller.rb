class Api::V1::MeetingsController < ApplicationController
    before_action :find_meeting, only: [:show, :edit, :delete]
    
    def index
        meetings = Meeting.all
        render :json => meetings, each_serializer: MeetingSerializer
    end
    
    def show
        meeting = Meeting.find(params[:id])
        render :json => meeting, each_serializer: MeetingSerializer
    end
    
    def create
        meeting = Meeting.create(meeting_params)
        if meeting.valid?
            render json: {meeting: Meeting.new(meeting)}, status: :created
        else
            render json: {eror: 'failed to create meeting'}, status: :not_acceptable
        end
    end
    
    def update
        meeting = Meeting.find(params[:id])
        meeting.update(meeting_params)
        render :json => meeting, each_serializer: MeetingSerializer
    end
    
    def delete
        meeting = Meeting.find(params[:id])
        meeting.destroy
        render json: {}
    end
    
    private
    
    def meeting_params
        params.require(:meeting).permit(:date, :time, :link, :title, :about, :excerpt, :club_id)
    end
    
    
end
