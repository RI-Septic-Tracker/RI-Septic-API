class TestHole < ApplicationRecord
  belongs_to :property
  has_many :user_test_holes
  has_many :users, through: :user_test_holes
end
