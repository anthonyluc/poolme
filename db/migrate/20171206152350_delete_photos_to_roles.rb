class DeletePhotosToRoles < ActiveRecord::Migration[5.1]
  def change
    remove_column :roles, :photos
  end
end
