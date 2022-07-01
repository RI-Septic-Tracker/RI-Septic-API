class Api::V1::UsersController < ApplicationController

    def create
      params[:user] = JSON.parse(request.raw_post)
      user = User.new(user_params)
      if user.save
        render(json: UserSerializer.new(user), status: :created)
      else
        render(json: {status: 400, message: "#{user.errors.full_messages.to_sentence}", data: user.errors}, status: :bad_request)
      end
    end

    def login
      user = User.find_by(email: params[:email])
      #binding.pry
      if !user
        render(json: {status: 400, message: "No user Found"}, status: :bad_request)
      else
        if user.authenticate(params[:password])
          #binding.pry
          render(json: UserSerializer.new(user), status: :created)
        elsif user.authenticate(params[:password]) == false
          render(json: {status: 400, message: "Credentials do not match"}, status: :bad_request)         
        end
      end
    end
    
      private
    def user_params
      params[:user].permit(:email, :password, :password_confirmation)
    end
  end
