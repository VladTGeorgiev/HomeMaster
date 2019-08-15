class Api::V1::HomesController < ApplicationController

    def create
        home = Home.create(home_params)
            render json: home, status: :created
    end

    def update
        home = Home.find(params[:id])
        home.update(home_params)
            render json: { home: HomeSerializer.new(home), token: issue_token(user_id: @current_user.id)}, status: :created
    end

    def index
        render json: Home.all
    end

    def show
        home = Home.find(params[:id])
        render json: { home: HomeSerializer.new(home) }
    end

    private

    def home_params
        params.require(:home).permit(:name, :address_one, :address_two, :city, :postcode, :home_key)
    end
end
