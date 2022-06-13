# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_test_holes
  has_many :test_holes, through: :user_test_holes

  validates_presence_of :city
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :phone
  validates_presence_of :email
  validates_presence_of :inspector
end
