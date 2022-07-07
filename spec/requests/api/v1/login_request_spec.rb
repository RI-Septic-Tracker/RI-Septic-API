# frozen_string_literal: true
# rubocop:disable all

require 'rails_helper'
require 'pry'

RSpec.describe 'UsersController' do
  before(:each) do
    @user = User.create!(name: 'mitch',
                         city: 'cityplace',
                         address: '123 fake st',
                         phone: '123456',
                         email: 'email@email.com',
                         role: 'contractor',
                         password: 'password',
                         password_confirmation: 'password')
  end

  it 'Logs in user', :vcr do
    user_params = {
      'email': @user.email.to_s,
      'password': @user.password.to_s
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/login', headers: headers, params: user_params.to_json
    # binding.pry
    parsed_data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(parsed_data[:data]).to have_key(:id)
    expect(parsed_data[:data]).to have_key(:type)
    expect(parsed_data[:data]).to have_key(:attributes)
    expect(parsed_data[:data][:attributes]).to have_key(:email)
    # expect(parsed_data[:data][:attributes]).to have_key(:api_key)
  end

  it 'sad paths no email provided' do
    user_params = {

      "password": '12345',
      "password_confirmation": '12345'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/login', headers: headers, params: user_params.to_json
    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:status]).to eq(400)
    expect(parsed_data[:message]).to eq('No user Found')
  end

  it 'sad paths no pw provided' do
    user_params = {
      "email": 'email@email.com',

      "password_confirmation": 'password'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: user_params.to_json
    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:status]).to eq(400)
    expect(parsed_data[:message]).to eq("Password can't be blank, City can't be blank, Name can't be blank, Address can't be blank, and Phone can't be blank")
  end

  it 'sad paths no pw or pw-c provided' do
    user_params = {
      "email": 'email@email.com'
    }
    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/login', headers: headers, params: user_params.to_json
    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:status]).to eq(400)
    expect(parsed_data[:message]).to eq('Credentials do not match')
  end
end
