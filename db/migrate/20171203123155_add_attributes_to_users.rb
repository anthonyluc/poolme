class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :username, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :photos, :string
    add_column :users, :newsletter, :boolean
    add_column :users, :model, :boolean
    add_column :users, :blocked, :boolean
    add_column :users, :gender, :string
    add_column :users, :ethnicity, :string
    add_column :users, :skin_color, :string
    add_column :users, :hair_color, :string
    add_column :users, :haircut, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :corpulence, :string
  end
end
