module Api
  module V1
    class PropertiesController < ApplicationController
      def create
        prop = Property.create!(property_params)
        render json: PropertySerializer.new(prop)
      end
      private
      def property_params
        params.require(:property).permit(:city, :street, :num, :bedrooms)
      end
    end
  end
end
