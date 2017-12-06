class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number_pro, :string
    add_column :users, :email_pro, :string
    add_column :users, :grade_company, :string
    add_column :users, :description_pro, :text
  end
end
