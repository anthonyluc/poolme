class CreateHairColors < ActiveRecord::Migration[5.1]
  def change
    create_table :hair_colors do |t|
      t.string :name

      t.timestamps
    end
  end
end
