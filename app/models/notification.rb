require 'twilio-ruby'
require "dotenv"
Dotenv.load

require 'pry'

class Notification < ApplicationRecord

    def self.send_sms(body, media_url)

        media_arr = media_url.split(',')

        # binding.pry
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']

        @client = Twilio::REST::Client.new(account_sid, auth_token)

        #! create if statement - if media_arr is empty use send out without media_url key
        numbers_to_message = ['+16313366416', '+15163590964']
        numbers_to_message.each do |number|
            message = @client.messages.create(
                body: body,
                from: '+13606376373',
                media_url: media_arr,
                to: number
            )
            puts message.status
        end
    end
end