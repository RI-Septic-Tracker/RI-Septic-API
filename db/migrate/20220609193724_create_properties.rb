# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :city
      t.string :street
      t.integer :num
      t.integer :bedrooms

      t.timestamps
    end
  end
end
