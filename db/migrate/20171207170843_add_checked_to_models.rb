class AddCheckedToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :checked, :boolean
  end
end
