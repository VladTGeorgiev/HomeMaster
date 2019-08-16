class Api::V1::BillsplitsController < ApplicationController
    def index
        render json: BillSplit.all
    end

    def create
        # byebug
        bill_split = BillSplit.create(bill_split_params)
        render json: { bill_split: BillsplitSerializer.new(bill_split)}
    end

    def show
        bill_split = BillSplit.find_by(id: params[:id])
        if bill_split 
            render json: {bill_split: BillsplitSerializer.new(bill_split)}
        else
            render plain: "This bill_split doesn't exist"
        end
    end

    def update
        bill_split = BillSplit.find(params[:id])
        bill_split.update(bill_split_params)
    end

    def destroy
        bill_split = BillSplit.find_by(id: params[:id])
        bill_split.destroy
    end

    private

    def bill_split_params
        params.require(:bill_split).permit(:paid, :amount, :bill_id, :user_id)
    end
end
