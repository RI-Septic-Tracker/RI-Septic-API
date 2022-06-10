class Property < ApplicationRecord
  has_many :test_holes
  has_many :user_test_holes, through: :test_holes
  has_many :users, through: :user_test_holes
end
