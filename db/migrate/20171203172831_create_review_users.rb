class CreateReviewUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :review_users do |t|
      t.integer :note
      t.text :commentary
      t.integer :alert
      t.boolean :hide
      t.references :legal_representative, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
