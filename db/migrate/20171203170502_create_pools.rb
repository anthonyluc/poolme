class CreatePools < ActiveRecord::Migration[5.1]
  def change
    create_table :pools do |t|
      t.references :model, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.boolean :closed

      t.timestamps
    end
  end
end
