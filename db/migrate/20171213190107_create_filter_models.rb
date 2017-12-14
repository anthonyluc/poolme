class CreateFilterModels < ActiveRecord::Migration[5.1]
  def change
    create_table :filter_models do |t|
      t.string :gender, array: true
      t.string :ethnicity, array: true
      t.string :hair_color, array: true
      t.string :haircut, array: true
      t.integer :height, array: true
      t.string :corpulence, array: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
