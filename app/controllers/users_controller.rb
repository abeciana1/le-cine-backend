class UsersController < ApplicationController
    
    def index
        users = User.all
    end
    
    def show
        user = User.find(params[:id])
    end
    
    def create

        # @user = User.new(user_params)
        # if @user.valid?
        # @user.save
        # redirect_to user_path(@user)
        # else
        # flash[:my_errors] = @user.errors.full_messages
        # redirect_to new_user_path
        # end
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        
    end
    
    def delete
        user = User.find(params[:id])
        user.destroy
    
        
    end
    
    private
    
    def user_params
        params.require(:user).permit('fields')
    end
    
    

end
