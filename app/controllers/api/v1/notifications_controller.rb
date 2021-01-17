require 'pry'

class Api::V1::NotificationsController < ApplicationController
    skip_before_action :authorized, only: [:alert_users, :create]

    def alert_users
        # notification_params
        # binding.pry
        Notification.send_sms(notification_params[:body], notification_params[:media_url])
    end

    def create
        notification = Notification.create(notification_params)
        if notification_parmas.valid?
            render json: {notification: NotificationSerializer.new(notification)}, status: :created
        else
            render json: {error: "failed to create notification"}, status: :not_acceptable
        end
    end

    private

    def notification_params
        params.require(:notification).permit(:body, :media_url)
    end
end
