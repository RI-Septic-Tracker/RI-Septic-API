# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TestHole, type: :model do
  describe 'relationships' do
    it { should have_many(:user_test_holes) }
    it { should have_many(:users).through(:user_test_holes) }
    it { should belong_to(:property) }
  end

  describe 'validations' do
    it { should validate_presence_of(:property_id) }
    it { should validate_presence_of(:shwt) }
    it { should validate_presence_of(:notes) }
    it { should validate_presence_of(:load_rate) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:inspector_present) }
  end
end
