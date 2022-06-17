# frozen_string_literal: true

# creates user test hole links
class CreateUserTestHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_test_holes do |t|
      t.references :user, foreign_key: true
      t.references :test_hole, foreign_key: true
    end
  end
end
