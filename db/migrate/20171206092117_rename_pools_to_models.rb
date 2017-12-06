class RenamePoolsToModels < ActiveRecord::Migration[5.1]
  def change
    rename_table :pools, :models
  end
end
