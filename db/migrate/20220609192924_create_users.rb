# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :city
      t.string :address
      t.string :phone
      t.integer :role
      t.string :email

      t.timestamps
    end
  end
end
