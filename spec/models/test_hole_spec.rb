require 'rails_helper'

RSpec.describe TestHole, type: :model do
  describe 'relationships' do
    it { should have_many(:user_test_holes) }
    it { should have_many(:users).through(:user_test_holes) }
    it { should belong_to(:property)}
  end
end
