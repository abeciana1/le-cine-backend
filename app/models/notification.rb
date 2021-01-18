require 'twilio-ruby'
require "dotenv"
Dotenv.load

require 'pry'

class Notification < ApplicationRecord

    # @@account_sid = ENV['TWILIO_ACCOUNT_SID']
    # @@auth_token = ENV['TWILIO_AUTH_TOKEN']

    def self.send_sms(body, media_url)

        media_arr = media_url.split(',')

        # binding.pry
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']

        @client = Twilio::REST::Client.new(account_sid, auth_token)

        #! create if statement - if media_arr is empty use send out without media_url key
        numbers_to_message = Subscriber.all
        subscribed = numbers_to_message.select { |subscriber| subscriber.status == true}
        
        subscribed.each do |subscriber|
            if media_arr.empty?
                message = @client.messages.create(
                    body: body,
                    from: '+19177468440',
                    to: subscriber["phone_number"]
                )
            elsif !media_arr.include? "http"
                message = @client.messages.create(
                    body: body,
                    from: '+19177468440',
                    to: subscriber["phone_number"]
                )
            else
                message = @client.messages.create(
                    body: body,
                    from: '+19177468440',
                    media_url: media_arr,
                    to: subscriber["phone_number"]
                )
            end
            puts message.status
        end
    end

    def self.welcome
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        # binding.pry
        @client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

        # f_name = subscriber.name.split(" ")[0]
        subscriber = Subscriber.last

        message = @client.messages.create(
                    body: "Hey, welcome to Pandemic Film Club! Each week you can text "pfc" (no case sensitivity) to find out the discussion and watchalong films. Also, feel free to check out http://localhost:3000/pandemic-film-club for more info on the films.",
                    from: '+19177468440',
                    to: subscriber["phone_number"]
                )
    end
end