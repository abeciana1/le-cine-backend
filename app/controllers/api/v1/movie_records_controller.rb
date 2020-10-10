class Api::V1::MovieRecordsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    private

    def movie_record_params
        params.permit(:movie_record).require(:title)
    end
end
