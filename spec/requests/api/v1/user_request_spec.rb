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
                   role: 'contractor', password: "password", password_confirmation: "password")
      User.create!(name: 'Charlie',
                   city: 'Cumberland',
                   address: '111  different fake st',
                   phone: '123456345',
                   email: 'email22@email.com',
                   role: 'contractor', password: "password", password_confirmation: "password")
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
                   role: "contractor", password: "password", password_confirmation: "password")
      User.create!(name: 'Charlie',
                   city: 'Cumberland',
                   address: '111  different fake st',
                   phone: '123456345',
                   email: 'email22@email.com',
                   role: 'contractor', password: "password", password_confirmation: "password")
      User.create!(name: 'Alan',
                   city: 'Foster',
                   address: '111 second different fake st',
                   phone: '123456345',
                   email: 'email44@email.com',
                   role: 'inspector', password: "password", password_confirmation: "password")
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
                 role: :contractor, password: "password", password_confirmation: "password")
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

  describe 'registering a new user' do
    it 'can register a new user'  do
      data = {
        "name": "David",
        "email": "whatever@example.com",
        "city": "somecity",
        "address": "123 fake st",
        "phone":"11231234",
        "password": "password",
        "password_confirmation": "password"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}
      post '/api/v1/contractors', headers: headers, params: JSON.generate(data)
      reply = JSON.parse(response.body, symbolize_names: true)
      expect(reply).to be_a Hash
      expect(reply).to have_key(:data)
      expect(reply[:data]).to have_key(:id)
      expect(reply[:data]).to have_key(:type)
      expect(reply[:data]).to have_key(:attributes)
      expect(reply[:data][:type]).to eq("user")
      expect(reply[:data][:attributes]).to have_key(:name)
      expect(reply[:data][:attributes]).to have_key(:city)
      expect(reply[:data][:attributes]).to have_key(:phone)
      expect(reply[:data][:attributes]).to have_key(:email)
    end
    xit 'returns a an error for missmatched passwords' do
      data = {
        "name": "David",
        "email": "whatever@example.com",
        "city": "somecity",
        "address": "123 fake st",
        "phone":"11231234",
        "password": "password",
        "password_confirmation": "paasdfssword"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}
      post '/api/v1/contractors', headers: headers, params: JSON.generate(data)
      reply = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(reply).to have_key(:data)
      expect(reply[:data]).to have_key(:message)
      expect(reply[:data][:message]).to eq("passwords do not match")
    end

    xit 'returns and error for duplicated emails' do
      user = User.create!(address:"234fda",phone:"1341234", city:"somecity",name:"steve",email: "whatever@example.com", password: "password", password_confirmation: "password")
      data = {
        "name": "David",
        "email": "whatever@example.com",
        "city": "somecity",
        "address": "123 fake st",
        "phone":"11231234",
        "password": "password",
        "password_confirmation": "password"
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(data)
      reply = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(reply).to have_key(:data)
      expect(reply[:data]).to have_key(:message)
      expect(reply[:data][:message]).to eq("that email already exists")
    end

    xit 'handles other errors' do
      data = {
        "name": nil,
        "email": nil,
        "city": nil,
        "address": nil,
        "phone":nil,
        "password": nil,
        "password_confirmation": nil
      }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}
      post '/api/v1/users', headers: headers, params: JSON.generate(data)
      reply = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(reply[:data][:message]).to eq("unable to create user")
    end
  end
end
