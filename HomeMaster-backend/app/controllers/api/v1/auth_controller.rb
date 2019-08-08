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
        current_home = User.find(user.id).home
        current_users = User.all.select do |current_user| 
            current_user.home_id === user.home.id
        end
        current_bills = Bill.all.select do |bill| 
            bill.home_id === user.home.id
        end
        current_bill_splits = BillSplit.all.select do |billsplit| 
            billsplit.home_id === user.home.id
        end
        current_tasks = Task.all.select do |task|
            task.home_id === user.home.id
        end
        current_essentials = Essential.all.select do |essentail|
            essentail.home_id === user.home.id
        end
        if user
            render json: {
                home: current_home,
                users: current_users,
                bills: current_bills,
                bill_splits: current_bill_splits,
                tasks: current_tasks,
                essentials: current_essentials
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
