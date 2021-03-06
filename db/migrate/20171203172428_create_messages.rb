class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :discussion_id, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
