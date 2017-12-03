class CreateReviewProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :review_projects do |t|
      t.integer :note
      t.text :commentary
      t.integer :alert
      t.boolean :hide
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
