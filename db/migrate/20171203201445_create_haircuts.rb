class CreateHaircuts < ActiveRecord::Migration[5.1]
  def change
    create_table :haircuts do |t|
      t.string :name

      t.timestamps
    end
  end
end
