class AddColumnToReviewUsers < ActiveRecord::Migration[5.1]
  def change
     add_column :review_users, :company_user_id, :integer
     add_column :review_users, :project_id, :integer
  end
end
