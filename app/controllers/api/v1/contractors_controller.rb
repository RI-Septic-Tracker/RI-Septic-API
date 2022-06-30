# frozen_string_literal: true

module Api
  module V1
    # controller for contractor users
    class ContractorsController < ApplicationController
      def index
        users = User.where(role: 'contractor')
        if users != []
          render json: UserSerializer.new(users)
        else
          render json: { data: { message: 'well thats not right, try something different' } }, status: :bad_request
        end
      end

      def show
        contractor = User.find(params[:id])
        render json: UserSerializer.new(contractor)
      end

      def create
        user = User.create!(contractor_params)
        binding.pry
        render json: UserSerializer.new(user)
      end

      private

      def contractor_params
        params.require(:contractor).permit(:name, :email, :password, :password_confirmation, :city, :address, :phone)
      end
    end
  end
end
