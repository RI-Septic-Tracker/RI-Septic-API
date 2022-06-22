# frozen_string_literal: true

module Api
  module V1
    # controller for contractor users
    class ContractorsController < ApplicationController
      def index
        users = User.where(inspector: false)
        render json: UserSerializer.new(users)
      end
    end
  end
end
