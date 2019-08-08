class Api::V1::BillsplitsController < ApplicationController
    def index
        render json: BillSplit.all
    end
end
