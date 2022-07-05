require 'rails_helper'

RSpec.describe "testhole requests" do
  describe 'test hole post requests' do
    it 'posts a new test hole' do
      prop = Property.create!(
              city: "Cumberland",
              street: "Sun Valley Dr",
              num: "126",
              bedrooms: "3")
      data = {
              "property_id": "#{prop.id}",
              "shwt": "36",
              "notes": "large tree nearby",
              "date": "2022-7-5",
              "inspector_present": "true",
              "ledge_depth": "999",
              "load_rate": "0.7"
              }
              headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}
              post '/api/v1/testholes', headers: headers, params: JSON.generate(data)
              reply = JSON.parse(response.body, symbolize_names: true)
              expect(reply).to be_a Hash
              expect(reply).to have_key(:data)
              expect(reply[:data]).to have_key(:id)
              expect(reply[:data]).to have_key(:type)
              expect(reply[:data]).to have_key(:attributes)
              expect(reply[:data][:attributes]).to have_key(:property_id)
              expect(reply[:data][:attributes]).to have_key(:shwt)
              expect(reply[:data][:attributes]).to have_key(:ledge_depth)
              expect(reply[:data][:attributes]).to have_key(:notes)
              expect(reply[:data][:attributes]).to have_key(:inspector_present)
              expect(reply[:data][:attributes]).to have_key(:date)
              expect(reply[:data][:attributes]).to have_key(:load_rate)
              expect(reply[:data][:attributes]).to have_key(:created_at)
              expect(reply[:data][:attributes]).to have_key(:updated_at)
    end
  end
end
