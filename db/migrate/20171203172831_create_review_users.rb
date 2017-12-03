class CreateReviewUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :review_users do |t|
      t.integer :note
      t.text :commentary
      t.references :legal_representative, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
