require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'user index requests' do
    it 'sends a list of all contractors and basic contact information' do
      user_1 = User.create!(name: "Rich",
                          city: "Cumberland",
                          address: "123 fake st",
                          phone: "123456",
                          email: "email@email.com",
                          inspector:false)
      user_2 = User.create!(name: "Charlie",
                          city: "Cumberland",
                          address: "111  different fake st",
                          phone: "123456345",
                          email: "email22@email.com",
                          inspector:false)
    get '/api/v1/contractors'
    expect(response).to be_successful
    contractors = JSON.parse(response.body, symbolize_names: true)
    expect(contractors).to be_a Hash
    # binding.pry
    end
  end
end
