class DropLegalRepresentativesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :legal_representatives
  end
end
