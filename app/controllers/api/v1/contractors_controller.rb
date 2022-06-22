# frozen_string_literal: true

module Api
  module V1
    # controller for contractor users
    class ContractorsController < ApplicationController
      def index
        users = User.where(inspector: false)
        if users != []
          render json: UserSerializer.new(users)
        else
          render json: { data: { message: 'well thats not right, try something different' } }, status: :bad_request
        end
      end
    end
  end
end
