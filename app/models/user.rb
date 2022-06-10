class User < ApplicationRecord
  has_many :user_test_holes
  has_many :test_holes, through: :user_test_holes
end
