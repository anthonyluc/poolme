class CreateHeights < ActiveRecord::Migration[5.1]
  def change
    create_table :heights do |t|
      t.integer :cm

      t.timestamps
    end
  end
end
