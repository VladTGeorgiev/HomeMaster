class Api::V1::EssentialsController < ApplicationController

    def create
        essential = Essential.create(essential_params)
            render json: { essential: EssentialSerializer.new(essential), token: issue_token(user_id: @current_user.id)}, status: :created
    end

    def update
        essential = Essential.find(essential_params[:id].to_i)
            essential.update(essential_params)
            render json: { essential: EssentialSerializer.new(essential), token: issue_token(user_id: @current_user.id)}, status: :created
    end

    def destroy
        essential = Essential.find(essential_params[:id].to_i)
            essential.delete
            render json: { message: 'Item Successfully deleted'}, status: :created
    end

    private 

    def essential_params
        params.require(:essential).permit(:id, :name, :more, :home_id)
    end

end
