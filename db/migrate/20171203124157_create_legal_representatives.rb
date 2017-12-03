class CreateLegalRepresentatives < ActiveRecord::Migration[5.1]
  def change
    create_table :legal_representatives do |t|
      t.string :grade
      t.string :phone_number
      t.string :email
      t.text :description
      t.references :company, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
