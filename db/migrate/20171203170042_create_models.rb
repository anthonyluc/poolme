class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.string :name
      t.text :description
      t.string :photos
      t.datetime :date_start
      t.datetime :date_end
      t.integer :income
      t.integer :selected_user_id
      t.references :project, foreign_key: true
      t.string :gender
      t.string :ethnicity
      t.string :skin_color
      t.string :hair_color
      t.string :haircut
      t.integer :height
      t.string :weight
      t.string :corpulence

      t.timestamps
    end
  end
end
