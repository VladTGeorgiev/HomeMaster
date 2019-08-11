class Api::V1::TasksController < ApplicationController

    def create
        task = Task.create(task_params)
            render json: { task: TaskSerializer.new(task), token: issue_token(user_id: @current_user.id)}, status: :created
    end

    def update
        task = Task.find(task_params[:id].to_i)
            task.update(task_params)
            render json: { task: TaskSerializer.new(task), token: issue_token(user_id: @current_user.id)}, status: :created
    end

    def destroy
        task = Task.find(task_params[:id].to_i)
            task.delete
            render json: { message: 'Item Successfully deleted'}, status: :created
    end

    private 

    def task_params
        params.require(:task).permit(:id, :name, :description, :day, :completed, :home_id, :user_id, :img)
    end

end
