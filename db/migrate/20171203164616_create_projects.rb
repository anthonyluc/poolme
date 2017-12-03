class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :date_start, index: true
      t.datetime :date_end, index: true
      t.string :country, index: true
      t.string :photos
      t.boolean :done, index: true
      t.references :company, foreign_key: true, index: true

      t.timestamps
    end
  end
end
