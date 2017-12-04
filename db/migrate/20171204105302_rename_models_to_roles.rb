class RenameModelsToRoles < ActiveRecord::Migration[5.1]
  def change
    rename_table :models, :roles
  end
end
