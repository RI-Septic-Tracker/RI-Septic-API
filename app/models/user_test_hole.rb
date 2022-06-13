# frozen_string_literal: true

class UserTestHole < ApplicationRecord
  belongs_to :user
  belongs_to :test_hole
end
