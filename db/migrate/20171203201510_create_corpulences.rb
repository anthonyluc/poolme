class CreateCorpulences < ActiveRecord::Migration[5.1]
  def change
    create_table :corpulences do |t|
      t.string :name

      t.timestamps
    end
  end
end
