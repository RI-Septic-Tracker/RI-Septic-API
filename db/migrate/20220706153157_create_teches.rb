# frozen_string_literal: true

# Creates tech table
class CreateTeches < ActiveRecord::Migration[5.2]
  def change
    create_table :teches do |t|
      t.string :brand
      t.string :model
      t.string :sqft
      t.string :unit

      t.timestamps
    end
  end
end
