require 'pry'

class Api::V1::SubscribersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]

    def index
        subscribers = Subscriber.all
        render :json => subscribers, each_serializer: SubscriberSerializer
    end

    def show
        subscriber = Subscriber.find(params[:id])
        render :json => subscriber, each_serializer: SubscriberSerializer
    end

    def create
        subscriber = Subscriber.create(subscriber_params)
        if subscriber.valid?
            # Notification.welcome
            render json: {subscriber: SubscriberSerializer.new(subscriber_params)}, status: :created
        else
            render json: { error: 'failed to become subscriber'}, status: :not_acceptable
        end
    end

    def update
        subscriber = Subscriber.find(params[:id])
        subscriber.update(subscriber_params)
        render :json => subscriber, each_serializer: SubscriberSerializer
    end
    
    def destroy
        subscriber = Subscriber.find(params[:id])
        subscriber.destroy
        render json: {}
    end

    private

    def subscriber_params
        params.require(:subscriber).permit(:name, :phone_number, :email_address, :status)
    end

end
