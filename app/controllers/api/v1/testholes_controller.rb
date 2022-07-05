module Api
  module V1
    # controller for property DB
    class TestholesController < ApplicationController
      def create
        th = TestHole.new(testhole_params)
          if th.save
            render(json: TestHoleSerializer.new(th), status: :created)
          end
      end

      private

      def testhole_params
          params.require(:testhole).permit(:property_id, :shwt, :notes, :date, :inspector_present, :ledge_depth, :load_rate)
      end
    end
  end
end
