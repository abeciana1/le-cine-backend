require 'twilio-ruby'
require "dotenv"
Dotenv.load

require 'pry'

class Notification < ApplicationRecord

    def send_sms(body)
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']

        @client = Twilio::REST::Client.new(account_sid, auth_token)

        numbers_to_message = ['+16313366416']
        numbers_to_message.each do |number|
            message = @client.messages.create(
                body: body,
                from: '+13606376373',
                media_url: ['https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg'],
                to: number
            )
            puts message.status
        end
    end
end