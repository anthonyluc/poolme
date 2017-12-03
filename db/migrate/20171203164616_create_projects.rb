class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :date_start
      t.datetime :date_end
      t.string :country
      t.string :photos
      t.boolean :done
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
