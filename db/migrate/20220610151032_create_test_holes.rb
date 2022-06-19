# frozen_string_literal: true

# creates testhole table
class CreateTestHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :test_holes do |t|
      t.references :property, foreign_key: true
      t.integer :shwt
      t.integer :ledge_depth
      t.string :notes
      t.boolean :inspector_present
      t.datetime :date
      t.float :load_rate

      t.timestamps
    end
  end
end
