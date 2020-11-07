class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    def index
        @lists = List.all 
        render :index 
    end

    def show
        render :show
    end

    def new 
        @list = List.new 
        render :new 
    end

    def create
        list = List.create(list_params)
        redirect_to new_task_path
    end

    def edit
        render :edit 
    end

    def update
        @list.update(list_params)
        redirect_to list_path(@list)
    end

    def destroy 
        @list.destroy 
        redirect_to lists_path
    end

    private

    def list_params
        params.require(:list).permit(:category, :complete)
    end

    def set_list 
        @list = List.find(params[:id])
    end
end