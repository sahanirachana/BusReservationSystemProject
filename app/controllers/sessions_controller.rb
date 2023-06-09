class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            render "new"
        end
    end

    def destroy
        session[:user_id] = nil
            redirect_to users_url
    end
end
