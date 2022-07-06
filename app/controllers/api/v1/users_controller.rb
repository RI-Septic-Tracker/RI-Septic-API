# frozen_string_literal: true

module Api
  module V1
    # controler for user requests
    class UsersController < ApplicationController
      def create
        params[:user] = JSON.parse(request.raw_post)
        user = User.new(user_params)
        if user.save
          render(json: UserSerializer.new(user), status: :created)
        else
          render(json: { status: 400, message: user.errors.full_messages.to_sentence.to_s, data: user.errors },
                 status: :bad_request)
        end
      end

      def login
        user = User.find_by(email: params[:email])
        # binding.pry
        if !user
          render(json: { status: 400, message: 'No user Found' }, status: :bad_request)
        elsif user.authenticate(params[:password])
          render(json: UserSerializer.new(user), status: :created)
        # binding.pry
        elsif user.authenticate(params[:password]) == false
          render(json: { status: 400, message: 'Credentials do not match' }, status: :bad_request)
        end
      end

      private

      def user_params
        params[:user].permit(:email, :password, :password_confirmation)
      end
    end
  end
end
