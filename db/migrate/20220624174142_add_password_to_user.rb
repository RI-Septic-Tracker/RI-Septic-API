# frozen_string_literal: true

# adds password to user table for bcrypt
class AddPasswordToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
  end
end
