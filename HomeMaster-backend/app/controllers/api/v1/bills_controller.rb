class Api::V1::BillsController < ApplicationController
    def index
        render json: Bill.all
    end

    def create
        bill = Bill.create(bill_params)
            render json: { bill: BillSerializer.new(bill), token: issue_token(user_id: @current_user.id)}, status: :created
    end

    def destroy
        bill = Bill.find(bill_params[:id].to_i)
            bill.delete
            render json: { message: 'Item Successfully deleted'}, status: :created
    end

    private 

    def bill_params
        params.require(:bill).permit(:id, :name, :total, :date_due, :home_id, :img, :provider)
    end
end
