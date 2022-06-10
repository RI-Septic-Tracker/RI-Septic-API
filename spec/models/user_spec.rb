require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_test_holes) }
    it { should have_many(:test_holes).through(:user_test_holes) }
  end
end
