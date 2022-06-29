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
      expect(reply).to be_a Hash
      expect(reply).to have_key(:data)
      expect(reply[:data]).to have_key(:id)
      expect(reply[:data]).to have_key(:type)
      expect(reply[:data]).to have_key(:attributes)
      expect(reply[:data][:type]).to eq("property")
      expect(reply[:data][:attributes]).to have_key(:city)
      expect(reply[:data][:attributes]).to have_key(:street)
      expect(reply[:data][:attributes]).to have_key(:num)
      expect(reply[:data][:attributes]).to have_key(:bedrooms)
    end
  end
end
