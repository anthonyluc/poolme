class AddHoursToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :hours, :decimal
  end
end
