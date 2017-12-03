class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :username, :string
    add_column :users, :address, :text
    add_column :users, :city, :string, index: true
    add_column :users, :country, :string, index: true
    add_column :users, :photos, :string
    add_column :users, :newsletter, :boolean
    add_column :users, :model, :boolean, index: true
    add_column :users, :blocked, :boolean, index: true
    add_column :users, :gender, :string, index: true
    add_column :users, :ethnicity, :string, index: true
    add_column :users, :skin_color, :string, index: true
    add_column :users, :hair_color, :string, index: true
    add_column :users, :haircut, :string, index: true
    add_column :users, :height, :integer, index: true
    add_column :users, :weight, :integer, index: true
    add_column :users, :corpulence, :string, index: true
  end
end
