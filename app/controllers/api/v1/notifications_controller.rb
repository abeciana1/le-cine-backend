require 'pry'

class Api::V1::NotificationsController < ApplicationController

    def alert_users
        notification_params
        binding.pry
        Notification.send_sms(notification_params)
    end

    private

    def notification_params
        params.require(:notifications).permit(:body, :media_url)
    end
end
