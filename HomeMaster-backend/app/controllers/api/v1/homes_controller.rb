class Api::V1::HomesController < ApplicationController
    def create
        home = Home.create(home_params)
        home.user = @current_user
        if home.valid?
            home.save
            render json: home, status: :created
        else
            render json: { errors: home.errors.full_messages }, status: :not_accepted
        end
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
        params.require(:post).permit(:name, :address_one, :address_two, :city, :postcode, :home_key)
    end
end
