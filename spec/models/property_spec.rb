# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'relationships' do
    it { should have_many(:test_holes) }
    it { should have_many(:user_test_holes).through(:test_holes) }
    it { should have_many(:users).through(:user_test_holes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:num) }
    it { should validate_presence_of(:bedrooms) }
  end
end
