class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :countries
    drop_table :ethnicities
    drop_table :haircuts
    drop_table :skin_colors
    drop_table :hair_colors
    drop_table :corpulences
    drop_table :genders
    drop_table :heights
    drop_table :weights
  end
end
