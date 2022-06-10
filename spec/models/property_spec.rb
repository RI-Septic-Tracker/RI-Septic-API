require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'relationships' do
    it { should have_many(:test_holes) }
    it { should have_many(:user_test_holes).through(:test_holes) }
    it { should have_many(:users).through(:user_test_holes)}
  end
end
