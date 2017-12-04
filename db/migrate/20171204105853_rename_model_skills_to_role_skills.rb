class RenameModelSkillsToRoleSkills < ActiveRecord::Migration[5.1]
  def change
    rename_table :model_skills, :role_skills
  end
end
