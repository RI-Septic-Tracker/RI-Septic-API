class AddInspectorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inspector, :boolean
  end
end
