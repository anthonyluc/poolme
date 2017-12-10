class AddAgreedToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :agreed, :boolean, default: false
  end
end
