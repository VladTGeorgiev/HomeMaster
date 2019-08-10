class Api::V1::UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def index
        render json: User.all
    end

    def show
        user = User.find(params[:id])
        render json: { user: UserSerializer.new(user) }
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id)}, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :not_accepted
        end
    end

    def update
        if @current_user.id === params[:id].to_i
            @current_user.update(user_params)
            render json: { user: UserSerializer.new(@current_user), token: issue_token(user_id: @current_user.id)}, status: :created
        else
          render json: { errors: @current_user.errors.full_messages }, status: :not_accepted
        end
    end

    def destroy
        if @current_user.id === params[:id].to_i
            @current_user.delete
            render json: { message: 'User Successfully deleted'}, status: :created
        else
          render json: { errors: @current_user.errors.full_messages }, status: :not_accepted
        end
    end

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :home_id)
    end
end
