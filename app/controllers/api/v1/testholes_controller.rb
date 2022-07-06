# frozen_string_literal: true

module Api
  module V1
    # controller for property DB
    class TestholesController < ApplicationController
      def create
        th = TestHole.new(testhole_params)
        render(json: TestHoleSerializer.new(th), status: :created) if th.save
      end

      private

      def testhole_params
        params.require(:testhole).permit(:property_id, :shwt, :notes, :date, :inspector_present, :ledge_depth,
                                         :load_rate)
      end
    end
  end
end
