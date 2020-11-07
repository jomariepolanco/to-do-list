class TasksController < ApplicationController
    before_action :set_task, only: [:show, :complete_task, :edit, :update, :destroy]

    def show
        render :show 
    end

    def complete_task
        if params[:action] == 'complete_task'
            @task.update(complete: true)
            redirect_to list_path(@task.list)
        end
    end

    def new
        @task = Task.new 
        render :new 
    end

    def create
        task = Task.create(task_params)
        if task.valid?
            redirect_to list_path(task.list)
        else
            flash[:errors] = task.errors.full_messages
            redirect_to new_task_path
        end
    end

    def edit
        render :edit 
    end

    def update
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            flash[:errors] = task.errors.full_messages
            redirect_to edit_task_path
        end
    end

    private

    def task_params
        params.require(:task).permit(:content, :complete, :user_id, :list_id)
    end

    def set_task 
        @task = Task.find(params[:id])
    end
end