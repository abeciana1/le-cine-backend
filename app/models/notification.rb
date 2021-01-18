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
        numbers_to_message = Subscriber.all
        # numbers_to_message = ['+16313366416']
        numbers_to_message.each do |subscriber|
            # message = @client.messages.create(
            #     body: body,
            #     from: '+19177468440',
            #     media_url: media_arr,
            #     to: subscriber["phone_number"]
            # )
            puts message.status
        end
    end

    # def welcome
        #! create welcome message to new subscribers
    # end
end