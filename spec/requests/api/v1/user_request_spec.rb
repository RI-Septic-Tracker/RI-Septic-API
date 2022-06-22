# frozen_string_literal: true

# rubocop:disable all

require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'user index requests' do
    it 'sends a list of all contractors and basic contact information' do
      User.create!(name: 'Rich',
                   city: 'Cumberland',
                   address: '123 fake st',
                   phone: '123456',
                   email: 'email@email.com',
                   inspector: false)
      User.create!(name: 'Charlie',
                   city: 'Cumberland',
                   address: '111  different fake st',
                   phone: '123456345',
                   email: 'email22@email.com',
                   inspector: false)
      get '/api/v1/contractors'
      expect(response).to be_successful
      contractors = JSON.parse(response.body, symbolize_names: true)
      expect(contractors).to be_a Hash
      expect(contractors).to have_key(:data)
      expect(contractors[:data]).to be_a Array
      contractors[:data].each do |c|
        expect(c).to be_a Hash
        expect(c).to have_key(:id)
        expect(c).to have_key(:type)
        expect(c[:type]).to eq('user')
        expect(c).to have_key(:attributes)
        expect(c[:attributes]).to have_key(:name)
        expect(c[:attributes]).to have_key(:city)
        expect(c[:attributes]).to have_key(:phone)
        expect(c[:attributes]).to have_key(:email)
      end
    end
  end
end
