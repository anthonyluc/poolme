class RenameModelIdToRoleSkills < ActiveRecord::Migration[5.1]
  def change
    rename_column :role_skills, :model_id, :role_id
  end
end
