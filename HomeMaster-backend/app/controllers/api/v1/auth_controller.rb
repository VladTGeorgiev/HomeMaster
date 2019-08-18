class Api::V1::AuthController < ApplicationController
    skip_before_action :authorize, only: [:create, :validate]
    
    def create
        user = User.find_by(email: user_login_params[:email])
        if user && user.authenticate(user_login_params[:password])
            render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id) }, status: :accepted
        else
            render json: { message: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def data
        user = @current_user
        current_home = @current_user.home
        if user
            render json: {
                home: current_home,
                users: current_home.users,
                bills: current_home.bills,
                bill_splits: user.bill_splits,
                tasks: user.tasks,
                all_tasks: current_home.tasks,
                all_bill_splits: current_home.bill_splits,
                essentials: current_home.essentials
            }
        else
            render json: {error: "Data Not Avaliable"}
        end
    end

    def validate
        user = @current_user
        if user
            render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id)}, status: :accepted
        else 
            render json: { errors: 'invalid token '}, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:email, :password)
    end
end
