class CreateModelSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :model_skills do |t|
      t.references :skill, foreign_key: true
      t.references :model, foreign_key: true

      t.timestamps
    end
  end
end
