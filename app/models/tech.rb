# frozen_string_literal: true

class Tech < ApplicationRecord
  validates_presence_of :brand
  validates_presence_of :model
  validates_presence_of :sqft
  validates_presence_of :unit
end
