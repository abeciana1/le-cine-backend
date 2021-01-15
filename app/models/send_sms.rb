require 'twilio-ruby'
require "dotenv"
Dotenv.load


account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)
