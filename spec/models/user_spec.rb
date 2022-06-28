# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_test_holes) }
    it { should have_many(:test_holes).through(:user_test_holes) }
  end
  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    # it { should validate_presence_of(:role) }
    # it { should validate_presence_of(:inspector) }
    it { should validate_presence_of(:name) }
    it { should have_secure_password }
  end
end
