class RemoveInspectorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :inspector, :string
  end
end
