class ChangeWeightTypeToRoles < ActiveRecord::Migration[5.1]
  def change
    change_column :roles, :weight, 'integer USING CAST(weight AS integer)'
  end
end
