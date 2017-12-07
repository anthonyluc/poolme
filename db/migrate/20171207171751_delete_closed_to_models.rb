class DeleteClosedToModels < ActiveRecord::Migration[5.1]
  def change
    remove_column :models, :closed
  end
end
