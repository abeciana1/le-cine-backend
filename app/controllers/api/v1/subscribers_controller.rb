class Api::V1::SubscribersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]

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
            render json: {subscriber: SubscriberSerializer.new(subscriber_params)}, status: :created
        else
            render json: { error: 'failed to become subscriber'}, status: :not_acceptable
        end
    end

    private

    def subscriber_params
        params.require(:subscriber).permit(:name, :phone_number, :email_address, :status)
    end

end
