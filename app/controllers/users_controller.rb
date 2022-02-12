class UsersController < ApplicationController
    skip_before_action :authorize_user, only: :create

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
   
end

    def show 
        user = @current_user
        render json: user, status: :created
    end

#     def show 
#         user = User.find_by(id: session[:user_id])
#         render json: user, status: :created
# end

    private 

    def user_params 
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
