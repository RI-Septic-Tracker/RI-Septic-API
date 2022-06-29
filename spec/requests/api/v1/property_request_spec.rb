# frozen_string_literal: true

# rubocop:disable all

require 'rails_helper'

RSpec.describe 'Property Requests' do
  describe 'property post requests' do
    it 'can create property records' do
      data = {
        "city": "Cumberland",
        "street": "Sun Valley Dr",
        "num": "126",
        "bedrooms": "3"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}
      post '/api/v1/properties', headers: headers, params: JSON.generate(data)
      reply = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
