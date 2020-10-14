class Api::V1::MovieMeetingsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :destroy]
    
    def index
        movie_meetings = MovieMeeting.all
        render :json => movie_meetings, each_serializer: MovieMeetingSerializer
    end
    
    def show
        movie_meeting = MovieMeeting.find(params[:id])
        render :json => movie_meeting, each_serializer: MovieMeetingSerializer
    end
    
    def create
        movie_meeting = MovieMeeting.create(movie_meeting_params)
        if movie_meeting.valid?
            render json: { movie_meeting: MovieMeetingSerializer.new(movie_meeting)}, status: :created
        else
            render json: { error: 'failed to add movie to meeting'}, status: :not_acceptable
        end
    end
    
    def update
        movie_meeting = MovieMeeting.find(params[:id])
        movie_meeting.update(movie_meeting_params)
        render :json => movie_meeting, each_serializer: MovieMeetingSerializer
    end
    
    def destroy
        movie_meeting = MovieMeeting.find(params[:id])
        movie_meeting.destroy
        render json: {}
    end
    
    private
    
    def movie_meeting_params
        params.require(:movie_meeting).permit(:movie_id, :meeting_id, :discussion, :watch_along)
    end
    
    
end
