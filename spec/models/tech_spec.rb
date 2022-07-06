require 'rails_helper'

RSpec.describe Tech, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:sqft) }
    it { should validate_presence_of(:unit) }
  end
end
