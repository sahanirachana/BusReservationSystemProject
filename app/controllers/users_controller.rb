class UsersController < ApplicationController
    before_action :require_signin, except: [:new,:create]
    before_action :check_user, only: [:edit,:destroy]


    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        @reservations=@user.reservations
        @buses = @user.busdetails
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
             redirect_to user_path(@user)
            # redirect_to signin_path(@user)
        else 
            render "new"
        end
    end
    def destroy
        @user=User.find(params[:id])
        session[:user_id] = nil 
        @user.destroy
            redirect_to users_path
    end
    def edit
        @user=User.find(params[:id])
    end
    def update
        @user=User.find(params[:id])
        @user.update(user_params)
            redirect_to users_path
    end

    

    private



    def user_params
        params.require(:user).permit(:name,:contact,:email,:user_type,:password)
    end


    def check_user
        @user = User.find(params[:id])
        unless current_user == @user
          redirect_to root_url
        end
    end
end
