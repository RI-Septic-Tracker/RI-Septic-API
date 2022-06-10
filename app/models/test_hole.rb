class TestHole < ApplicationRecord
  belongs_to :property
  has_many :user_test_holes
  has_many :users, through: :user_test_holes

  validates_presence_of :property_id
  validates_presence_of :shwt
  validates_presence_of :notes
  validates_presence_of :date
  validates_presence_of :inspector_present
  validates_presence_of :load_rate
end
