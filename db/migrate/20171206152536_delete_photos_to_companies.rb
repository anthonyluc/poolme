class DeletePhotosToCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :photos
  end
end
