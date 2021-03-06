class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy] 
    def index 
        @users = User.all 
        render :index 
    end

    def show
        render :show 
    end

    def new
        @user = User.new 
        @teams = Team.all 
        render :new 
    end

    def create
        user = User.create(user_params)
        redirect_to user_path(user)
    end

    def edit 
        @teams = Team.all 
        render :edit 
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy 
        @user.destroy 
        redirect_to team_path(@user.team)
    end

    private

    def user_params
        params.require(:user).permit(:name, :team_id)
    end

    def set_user
        @user = User.find(params[:id])
    end
end