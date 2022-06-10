require 'rails_helper'

RSpec.describe UserTestHole do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:test_hole)}
  end
end
