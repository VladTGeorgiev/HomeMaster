class Api::V1::BillsController < ApplicationController
    def index
        render json: Bill.all
    end
end
