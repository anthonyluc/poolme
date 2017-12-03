class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :country
      t.string :email
      t.string :phone_number
      t.string :website
      t.string :photos
      t.boolean :blocked

      t.timestamps
    end
  end
end
