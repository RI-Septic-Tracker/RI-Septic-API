# frozen_string_literal: true

# adds inspector status to user
class AddInspectorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inspector, :boolean
  end
end
