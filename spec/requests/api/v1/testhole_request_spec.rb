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

    end
  end
end
