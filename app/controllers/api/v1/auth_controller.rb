require 'pry'

class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        # binding.pry
        @user = User.find_by(email: user_login_params[:email])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private

    def user_login_params
        # params.permit(:email, :password)
        params.require(:auth).permit(:email, :password)
    end
end