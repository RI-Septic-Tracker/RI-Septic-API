module Api
  module V1
    class PropertiesController < ApplicationController
      def create
        Property.create!(property_params)
      end
      private
      def property_params
        params.require(:property).permit(:city, :street, :num, :bedrooms)
      end
    end
  end
end
