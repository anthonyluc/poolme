class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.string :name
      t.text :description
      t.string :photos
      t.datetime :date_start
      t.datetime :date_end
      t.integer :income, index: true
      t.integer :selected_user_id
      t.references :project, foreign_key: true, index: true
      t.string :gender, index: true
      t.string :ethnicity, index: true
      t.string :skin_color, index: true
      t.string :hair_color, index: true
      t.string :haircut, index: true
      t.integer :height, index: true
      t.string :weight, index: true
      t.string :corpulence, index: true

      t.timestamps
    end
  end
end
