class SessionsController < ApplicationController

    def create
        user = User.find(username: params[:id])
        if user
            session[:user_id] = user.id
            render json: user
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

end
