# frozen_string_literal: true

# rubocop:disable all

require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'contractor index requests' do
    it 'sends a list of all contractors and basic contact information' do
      User.create!(name: 'Rich',
                   city: 'Cumberland',
                   address: '123 fake st',
                   phone: '123456',
                   email: 'email@email.com',
                   inspector: false, password: "password", password_confirmation: "password")
      User.create!(name: 'Charlie',
                   city: 'Cumberland',
                   address: '111  different fake st',
                   phone: '123456345',
                   email: 'email22@email.com',
                   inspector: false, password: "password", password_confirmation: "password")
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

    it 'ignores inspectors' do
      User.create!(name: 'Rich',
                   city: 'Cumberland',
                   address: '123 fake st',
                   phone: '123456',
                   email: 'email@email.com',
                   inspector: false, password: "password", password_confirmation: "password")
      User.create!(name: 'Charlie',
                   city: 'Cumberland',
                   address: '111  different fake st',
                   phone: '123456345',
                   email: 'email22@email.com',
                   inspector: false, password: "password", password_confirmation: "password")
      User.create!(name: 'Alan',
                   city: 'Foster',
                   address: '111 second different fake st',
                   phone: '123456345',
                   email: 'email44@email.com',
                   inspector: true, password: "password", password_confirmation: "password")
      get '/api/v1/contractors'
      expect(response).to be_successful
      contractors = JSON.parse(response.body, symbolize_names: true)
      expect(contractors[:data].count).to eq(2)
    end

    it 'returns and error when no users exist' do
      get '/api/v1/contractors'
      expect(response.status).to eq(400)
      expect(response.message).to eq('Bad Request')
      message = JSON.parse(response.body, symbolize_names: true)
      expect(message[:data][:message]).to eq("well thats not right, try something different")
    end

  end
  describe 'contractors show' do
    it 'can get a single contractors information' do
      user = User.create!(name: 'Rich',
                 city: 'Cumberland',
                 address: '123 fake st',
                 phone: '123456',
                 email: 'email@email.com',
                 inspector: false, password: "password", password_confirmation: "password")
                 get "/api/v1/contractors/#{user.id}"
      expect(response).to be_successful
      contractor = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(contractor).to be_a Hash
      expect(contractor).to have_key(:data)
      expect(contractor[:data]).to have_key(:id)
      expect(contractor[:data][:id]).to eq(user.id.to_s)
      expect(contractor[:data][:type]).to eq("user")
      expect(contractor[:data][:attributes]).to have_key(:name)
      expect(contractor[:data][:attributes][:name]).to eq(user.name)
      expect(contractor[:data][:attributes]).to have_key(:city)
      expect(contractor[:data][:attributes]).to have_key(:phone)
      expect(contractor[:data][:attributes][:phone]).to eq(user.phone)
      expect(contractor[:data][:attributes]).to have_key(:email)
      expect(contractor[:data][:attributes][:email]).to eq(user.email)
    end
  end
end
