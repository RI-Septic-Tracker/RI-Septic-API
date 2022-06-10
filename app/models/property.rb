class Property < ApplicationRecord
  #relationships
  has_many :test_holes
  has_many :user_test_holes, through: :test_holes
  has_many :users, through: :user_test_holes
  #required information, not all information is required for creation
  validates_presence_of :city
  validates_presence_of :street
  validates_presence_of :num
  validates_presence_of :bedrooms
end
