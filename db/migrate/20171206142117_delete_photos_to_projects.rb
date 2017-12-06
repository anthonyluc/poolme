class DeletePhotosToProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :photos
  end
end
