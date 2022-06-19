# frozen_string_literal: true

# removes unneed column from userW
class RemoveRoleFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role, :integer
  end
end
