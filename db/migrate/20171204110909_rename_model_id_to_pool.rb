class RenameModelIdToPool < ActiveRecord::Migration[5.1]
  def change
    rename_column :pools, :model_id, :role_id
  end
end
