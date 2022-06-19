class Api::V1::ContractorsController < ApplicationController
  def index
    users = User.where(inspector:false)
    render json: UserSerializer.new(users)
  end
end
